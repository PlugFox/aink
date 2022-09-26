import '../model/user_entity.dart';

abstract class IAuthenticationProvider {
  UserEntity get currentUser;

  Future<void> googleSignIn();

  Future<void> logOut();
}

class AuthenticationProviderFactory {
  AuthenticationProviderFactory();

  IAuthenticationProvider create() => throw UnimplementedError();
}
