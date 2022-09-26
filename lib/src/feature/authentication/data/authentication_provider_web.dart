import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_entity.dart';
import 'authentication_provider.dart';

IAuthenticationProvider $createAuthenticationProvider({required FirebaseAuth firebaseAuth}) =>
    AuthenticationProviderWeb(firebaseAuth: firebaseAuth);

class AuthenticationProviderWeb implements IAuthenticationProvider {
  AuthenticationProviderWeb({required FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  @override
  // TODO: implement currentUser
  UserEntity get currentUser => throw UnimplementedError();

  @override
  Future<void> googleSignIn() {
    // TODO: implement googleSignIn
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }
}
