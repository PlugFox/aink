import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;

class RestClient {
  RestClient({
    required String baseUri,
    http.Client? client,
  })  : _internalClient = client ?? http.Client(),
        _baseUri = Uri.parse(baseUri);

  final Uri _baseUri;
  final http.Client _internalClient;

  Future<Map<String, Object?>> request({
    required String path,
    required Map<String, Object?> data,
    Map<String, String>? headers,
  }) async {
    try {
      final json = utf8.encode(jsonEncode(data));
      final response = await _internalClient.post(
        buildUri(_baseUri, path),
        body: json,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          ...?headers,
        },
      );
      if (response.statusCode > 199 && response.statusCode < 300) {
        if (response.headers['Content-Type']?.contains('application/json') ?? false) {
          try {
            return jsonDecode(response.body) as Map<String, Object?>;
          } on Object catch (error, stackTrace) {
            Error.throwWithStackTrace(
              ServerInternalException(message: 'Server returned invalid json: $error'),
              stackTrace,
            );
          }
        } else {
          Error.throwWithStackTrace(
            ServerInternalException(
              message: 'Server returned invalid content type: ${response.headers['Content-Type'] ?? 'null'}',
            ),
            StackTrace.fromString('Headers: "${jsonEncode(response.headers)}"'),
          );
        }
      } else if (response.statusCode > 499) {
        throw ServerInternalException(statusCode: response.statusCode);
      } else if (response.statusCode > 399) {
        throw ClientRequestException(statusCode: response.statusCode);
      }
      throw UnsupportedError('Unsupported status code: ${response.statusCode}');
    } on NetworkException {
      rethrow;
    } on http.ClientException catch (error, stackTrace) {
      Error.throwWithStackTrace(InternetException(error.message), stackTrace);
    } on FormatException catch (error, stackTrace) {
      Error.throwWithStackTrace(UnsupportedError('FormatException: $error'), stackTrace);
    } on Object catch (error, stackTrace) {
      if (error is! NetworkException) {
        Error.throwWithStackTrace(UnsupportedError('Unknown exception: $error'), stackTrace);
      }
      rethrow;
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
    return baseUri
        .replace(
          path: p.normalize(p.join(baseUri.path, uri.path)),
          queryParameters: queryParameters.isEmpty ? null : queryParameters,
        )
        .normalizePath();
  }
}

abstract class NetworkException implements Exception {}

@immutable
class ServerInternalException implements NetworkException {
  const ServerInternalException({this.statusCode, this.message});
  final int? statusCode;
  final String? message;
}

@immutable
class ClientRequestException implements NetworkException {
  const ClientRequestException({this.statusCode, this.message});
  final int? statusCode;
  final String? message;
}

@immutable
class InternetException implements NetworkException {
  const InternetException(this.message);
  final String message;
}
