import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_entity.dart';
import 'authentication_provider_io.dart'
    // ignore: uri_does_not_exist
    if (dart.library.html) 'authentication_provider_web.dart';

abstract class IAuthenticationProvider {
  UserEntity get currentUser;

  Future<void> googleSignIn();

  Future<void> logOut();
}

class AuthenticationProviderFactory {
  AuthenticationProviderFactory();

  IAuthenticationProvider create({required FirebaseAuth firebaseAuth}) =>
      $createAuthenticationProvider(firebaseAuth: firebaseAuth);
}
