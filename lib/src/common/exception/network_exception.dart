import 'package:meta/meta.dart';

abstract class NetworkException implements Exception {}

@immutable
class ServerInternalException implements NetworkException {
  const ServerInternalException({this.statusCode, this.message});
  final int? statusCode;
  final String? message;
}

@immutable
class RestClientException implements NetworkException {
  const RestClientException({this.statusCode, this.message});
  final int? statusCode;
  final String? message;
}

@immutable
class InternetException implements NetworkException {
  const InternetException(this.message);
  final String message;
}
