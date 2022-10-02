import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:http/http.dart' as http;
import 'package:l/l.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:platform_info/platform_info.dart';

import '../exception/authentication_exception.dart';
import '../exception/network_exception.dart';

class RestClient with _RestAuthenticationTokenInterceptor, _RestPerformanceInterceptor {
  RestClient({
    required String uri,
    FirebasePerformance? performance,
    http.Client? client,
  })  : _baseUri = Uri.parse(uri),
        _performance = performance,
        _internalClient = client ?? http.Client();

  final Uri _baseUri;
  final http.Client _internalClient;
  final FirebasePerformance? _performance;

  Future<Map<String, Object?>> get({
    required String path,
    Map<String, String>? headers,
  }) =>
      _send('GET', path, headers);

  Future<Map<String, Object?>> post({
    required String path,
    required Map<String, Object?> data,
    Map<String, String>? headers,
  }) =>
      _send('POST', path, headers, data);

  /// Sends a non-streaming [http.Request] and returns a non-streaming [http.Response].
  Future<Map<String, Object?>> _send(
    String method,
    String path,
    Map<String, String>? headers, [
    Map<String, Object?>? body,
  ]) async {
    _RestPerformanceContext? traceContext;
    try {
      final request = http.Request(method, buildUri(_baseUri, path));
      if (body != null) request.bodyBytes = await _encodeRequestBody(body);
      request.headers.addAll(<String, String>{
        'Authentication': await _getToken(),
        if (body != null) ...<String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          if (Platform.I.isIO) 'Content-Length': request.bodyBytes.length.toString(),
        },
        if (Platform.I.isIO) ...<String, String>{
          'Connection': 'keep-alive',
          'Date': DateTime.now().toUtc().toIso8601String(),
          'Max-Forwards': '10',
          'Pragma': 'no-cache',
          'User-Agent': Platform.I.version,
          'DNT': '1',
        },
        ...?headers,
      });
      traceContext = _beginTrace(_performance, request);
      final response = await _internalClient.send(request).then<http.Response>(http.Response.fromStream);
      _completeTrace(_performance, traceContext, response);
      final message = 'REST > [${request.method.toUpperCase()}] ${request.url}';
      (response.statusCode < 400) ? l.i('$message | OK') : l.w('$message | ERR');
      if (response.statusCode > 199 && response.statusCode < 300) {
        return await _decodeResponse(response);
      } else if (response.statusCode > 499) {
        throw ServerInternalException(statusCode: response.statusCode);
      } else if (response.statusCode > 399) {
        throw RestClientException(statusCode: response.statusCode);
      }
      throw UnsupportedError('Unsupported status code: ${response.statusCode}');
    } on NetworkException {
      rethrow;
    } on http.ClientException catch (error, stackTrace) {
      Error.throwWithStackTrace(InternetException(error.message), stackTrace);
    } on HandshakeException catch (error, stackTrace) {
      Error.throwWithStackTrace(ServerInternalException(message: error.message), stackTrace);
    } on Object {
      rethrow;
    }
  }

  static FutureOr<List<int>> _encodeRequestBody(Map<String, Object?> body) {
    try {
      return utf8.encode(jsonEncode(body));
    } on Object catch (error, stackTrace) {
      Error.throwWithStackTrace(
        RestClientException(message: error.toString()),
        stackTrace,
      );
    }
  }

  static FutureOr<Map<String, Object?>> _decodeResponse(
    http.Response response,
  ) {
    if ((response.headers['content-type'] ?? response.headers['Content-Type'])?.contains('application/json') ?? false) {
      final body = response.body;
      try {
        final json = jsonDecode(body) as Map<String, Object?>;
        if (json['error'] != null) {
          Error.throwWithStackTrace(
            RestClientException(message: json['error'].toString()),
            StackTrace.fromString('${StackTrace.current}\n'
                'Error: "${jsonEncode(json['error'])}"'),
          );
        }
        return json['data']! as Map<String, Object?>;
      } on Object catch (error) {
        Error.throwWithStackTrace(
          ServerInternalException(
            message: 'Server returned invalid json: $error',
          ),
          StackTrace.fromString(
            '${StackTrace.current}\n'
            'Body: "${body.length > 100 ? '${body.substring(0, 97)}...' : body}"',
          ),
        );
      }
    } else {
      Error.throwWithStackTrace(
        ServerInternalException(
          message: 'Server returned invalid content type: '
              '${response.headers['content-type'] ?? response.headers['Content-Type'] ?? 'null'}',
        ),
        StackTrace.fromString('${StackTrace.current}\n'
            'Headers: "${jsonEncode(response.headers)}"'),
      );
    }
  }

  @visibleForTesting
  static Uri buildUri(Uri baseUri, String path) {
    final uri = Uri.tryParse(path);
    if (uri == null) return baseUri;
    final queryParameters = <String, Object?>{
      ...baseUri.queryParameters,
      ...uri.queryParameters,
    };
    return baseUri.replace(
      path: p.normalize(p.join(baseUri.path, uri.path)),
      queryParameters: queryParameters.isEmpty ? null : queryParameters,
    );
  }
}

mixin _RestAuthenticationTokenInterceptor {
  late final FirebaseAuth _authService = FirebaseAuth.instance;
  Future<String>? _future;

  @protected
  Future<String> _getToken() async {
    try {
      final user = _authService.currentUser;
      if (user == null) throw const AuthenticationException('User is not authenticated');
      return await (_future ??= user.getIdToken());
    } on AuthenticationException {
      rethrow;
    } on Object catch (error, stackTrace) {
      Error.throwWithStackTrace(
        RestClientException(message: 'Problem with retrieving token: $error'),
        stackTrace,
      );
    } finally {
      _future = null;
    }
  }
}

mixin _RestPerformanceInterceptor {
  @protected
  _RestPerformanceContext? _beginTrace(
    FirebasePerformance? performance,
    http.Request request,
  ) {
    try {
      if (performance == null) return null;
      final method = request.method.toUpperCase();
      final httpMethod = HttpMethod.values.firstWhere(
        (e) => e.name.toUpperCase() == method,
        orElse: () => HttpMethod.Trace,
      );
      final metric = performance.newHttpMetric(request.url.toString(), httpMethod);
      final trace = performance.newTrace('REST > [$method] ${request.url.host}');
      return _RestPerformanceContext(metric: metric, trace: trace, method: method, uri: request.url);
    } on Object catch (error, stackTrace) {
      l.w('Failed to start performance trace', stackTrace);
      return null;
    }
  }

  @protected
  void _completeTrace(
    FirebasePerformance? performance,
    _RestPerformanceContext? context,
    http.Response response,
  ) {
    if (context == null) return;
    final elapsed = (context.stopwatch..stop()).elapsed;
    if (performance == null) return;
    context.init.then<void>(
      (value) async {
        try {
          await Future<void>.delayed(Duration.zero);
          final requestPayloadSize = response.request?.contentLength ?? 0;
          final responseStatusCode = response.statusCode;
          final responseContentLength = response.contentLength ?? 0;
          final responseContentType =
              response.headers['content-type'] ?? response.headers['Content-Type'] ?? 'application/json; charset=utf-8';

          try {
            context.metric
              ..putAttribute('elapsed', elapsed.inMilliseconds.toString())
              ..requestPayloadSize = requestPayloadSize
              ..responsePayloadSize = responseContentLength
              ..responseContentType = responseContentType
              ..httpResponseCode = responseStatusCode;
            context.metric.stop().ignore();
          } on Object catch (error, stackTrace) {
            l.w('Failed to complete HttpMetric', stackTrace);
          }

          try {
            context.trace
              ..incrementMetric('rest_count', 1)
              ..incrementMetric(responseStatusCode < 400 ? 'rest_successful' : 'rest_error', 1)
              ..putAttribute('elapsed', elapsed.inMilliseconds.toString())
              ..putAttribute('status', response.statusCode.toString())
              ..putAttribute('content-type', responseContentType)
              ..putAttribute('content-length', responseContentLength.toString());
            context.trace.stop().ignore();
          } on Object catch (error, stackTrace) {
            l.w('Failed to complete Trace', stackTrace);
          }
        } on Object catch (error, stackTrace) {
          l.w('Failed to complete performance trace', stackTrace);
        }
      },
      onError: (Object error, StackTrace stackTrace) {
        l.w('Failed to complete performance trace', stackTrace);
      },
    ).ignore();
  }
}

class _RestPerformanceContext {
  _RestPerformanceContext({required this.metric, required this.trace, required String method, required Uri uri})
      : stopwatch = Stopwatch()..start(),
        init = Future.wait<void>(<Future<void>>[
          metric.start(),
          trace.start(),
        ]).whenComplete(() {
          try {
            metric
              ..putAttribute('method', method)
              ..putAttribute('host', uri.host)
              ..putAttribute('url', uri.toString());
          } on Object {
            l.w('Failed to set metric attributes');
          }
          try {
            trace
              ..putAttribute('method', method)
              ..putAttribute('host', uri.host)
              ..putAttribute('url', uri.toString());
          } on Object {
            l.w('Failed to set trace attributes');
          }
        }) {
    Timer(const Duration(seconds: 15), () {
      if (!stopwatch.isRunning) return;
      stopwatch.stop();
      l.w('HTTP REST Performance trace is still running after 15 seconds');
    });
  }

  final HttpMetric metric;
  final Trace trace;
  final Stopwatch stopwatch;
  final Future<void> init;
  bool _isCompleted = false;
  bool get isCompleted => _isCompleted;
  void complete() => _isCompleted = true;
}
