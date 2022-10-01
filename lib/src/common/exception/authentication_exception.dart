class AuthenticationException implements Exception {
  const AuthenticationException([this.message]);

  final String? message;

  @override
  String toString() => 'Authentication exception';
}
