part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const AuthenticationState._();
  const factory AuthenticationState.notAuthenticated({
    @Default('Not authenticated') final String message,
  }) = _notAuthenticated;

  const factory AuthenticationState.processing({
    required UserEntity user,
    @Default('Processing...') final String message,
  }) = _processing;

  const factory AuthenticationState.error({
    required UserEntity user,
    @Default('An error occurred during authentication') final String message,
  }) = _error;

  const factory AuthenticationState.authenticated({
    required AuthenticatedUser user,
    @Default('Authenticated') final String message,
  }) = _authenticated;

  // ignore: prefer_constructors_over_static_methods
  static AuthenticationState fromUser(UserEntity user) => user.map<AuthenticationState>(
        unauthenticated: (_) => const AuthenticationState.notAuthenticated(),
        authenticated: (user) => AuthenticationState.authenticated(user: user),
      );

  UserEntity get user => map<UserEntity>(
        notAuthenticated: (_) => const UserEntity.unauthenticated(),
        processing: (state) => state.user,
        error: (state) => state.user,
        authenticated: (state) => state.user,
      );

  AuthenticatedUser? get authenticatedOrNull => user.map<AuthenticatedUser?>(
        authenticated: (user) => user,
        unauthenticated: (_) => null,
      );

  bool get isAuthenticated => user.isAuthenticated;

  bool get isNotAuthenticated => user.isNotAuthenticated;

  bool get isProcessing => maybeMap<bool>(
        processing: (_) => true,
        orElse: () => false,
      );

  bool get isError => maybeMap<bool>(
        error: (_) => true,
        orElse: () => false,
      );

  bool get isNotError => !isError;
}
