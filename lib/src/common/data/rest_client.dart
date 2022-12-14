import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:platform_info/platform_info.dart';

import '../exception/network_exception.dart';

@immutable
class RestClient {
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
    } on Object catch (error, stackTrace) {
      if (error is! NetworkException) {
        Error.throwWithStackTrace(
          UnsupportedError('Unknown exception: $error'),
          stackTrace,
        );
      }
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
          message:
              'Server returned invalid content type: ${response.headers['content-type'] ?? response.headers['Content-Type'] ?? 'null'}',
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
