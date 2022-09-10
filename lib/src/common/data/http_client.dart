import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class HttpClient extends http.BaseClient implements http.Client {
  HttpClient({
    http.Client? client,
  }) : _internalClient = client ?? http.Client();

  final http.Client _internalClient;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    try {
      final response = await _internalClient.send(request);
      if (response.statusCode > 199 && response.statusCode < 300) {
        return response;
      } else if (response.statusCode > 499) {
        throw ServerInternalException(response.statusCode);
      } else if (response.statusCode > 399) {
        throw ClientRequestException(response.statusCode);
      }
      throw UnsupportedError('Unsupported status code: ${response.statusCode}');
    } on http.ClientException catch (error, stackTrace) {
      Error.throwWithStackTrace(InternetException(error.message), stackTrace);
    } on Object catch (error, stackTrace) {
      if (error is! NetworkException) {
        Error.throwWithStackTrace(UnsupportedError('Unknown exception: $error'), stackTrace);
      }
      rethrow;
    }
  }
}

abstract class NetworkException implements Exception {}

@immutable
class ServerInternalException implements NetworkException {
  const ServerInternalException(this.statusCode, [this.message]);
  final int statusCode;
  final String? message;
}

@immutable
class ClientRequestException implements NetworkException {
  const ClientRequestException(this.statusCode, [this.message]);
  final int statusCode;
  final String? message;
}

@immutable
class InternetException implements NetworkException {
  const InternetException(this.message);
  final String message;
}
