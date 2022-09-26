part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  AuthenticationState._();
  const factory AuthenticationState.notAuthenticated() = _notAuthenticated;
  const factory AuthenticationState.processing({required UserEntity user}) = _processing;
  const factory AuthenticationState.error({required UserEntity user}) = _error;
  const factory AuthenticationState.authenticated({required AuthenticatedUser user}) = _authenticated;

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

  AuthenticatedUser? get authenticatedOrNull => mapOrNull<AuthenticatedUser?>(
        notAuthenticated: (_) => null,
        processing: (state) => state.authenticatedOrNull,
        error: (state) => state.authenticatedOrNull,
        authenticated: (state) => state.user,
      );

  bool get isAuthenticated => map<bool>(
        notAuthenticated: (_) => false,
        processing: (state) => state.user.isAuthenticated,
        error: (state) => state.user.isAuthenticated,
        authenticated: (_) => true,
      );

  bool get isNotAuthenticated => !isAuthenticated;
}
