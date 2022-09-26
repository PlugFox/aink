import '../model/user_entity.dart';
import 'authentication_provider.dart';

abstract class IAuthenticationRepository {
  UserEntity get currentUser;

  Future<void> googleSignIn();

  Future<void> logOut();
}

class AuthenticationRepository implements IAuthenticationRepository {
  AuthenticationRepository({required IAuthenticationProvider authenticationProvider})
      : _authenticationProvider = authenticationProvider;

  final IAuthenticationProvider _authenticationProvider;

  @override
  UserEntity get currentUser => throw UnimplementedError();

  @override
  Future<void> googleSignIn() => _authenticationProvider.googleSignIn();

  @override
  Future<void> logOut() => _authenticationProvider.logOut();
}
