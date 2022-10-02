import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:platform_info/platform_info.dart';

import '../exception/authentication_exception.dart';
import '../exception/network_exception.dart';

class RestClient with _AuthenticationToken {
  RestClient({
    required String uri,
    http.Client? client,
  })  : _baseUri = Uri.parse(uri),
        _internalClient = client ?? http.Client();

  final Uri _baseUri;
  final http.Client _internalClient;

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
    try {
      final request = http.Request(method, buildUri(_baseUri, path));
      if (body != null) request.bodyBytes = await _encodeRequestBody(body);
      request.headers.addAll(<String, String>{
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
        'Authentication': await _getToken(),
      });
      final response = await _internalClient.send(request).then<http.Response>(http.Response.fromStream);
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

mixin _AuthenticationToken {
  static final FirebaseAuth _authService = FirebaseAuth.instance;
  static Future<String>? _future;

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
