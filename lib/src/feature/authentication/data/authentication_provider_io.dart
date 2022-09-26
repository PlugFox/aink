import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:l/l.dart';

import '../model/user_entity.dart';
import 'authentication_provider.dart';

const List<String> _kGoogleSignInScopes = <String>[
  'email',
  'profile',
  // 'https://www.googleapis.com/auth/contacts.readonly',
];

IAuthenticationProvider $createAuthenticationProvider({required FirebaseAuth firebaseAuth}) =>
    AuthenticationProviderIO(firebaseAuth: firebaseAuth);

class AuthenticationProviderIO implements IAuthenticationProvider {
  AuthenticationProviderIO({required FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  @override
  UserEntity get currentUser => UserEntity.fromFirebase(_firebaseAuth.currentUser);

  @override
  Stream<UserEntity> get userChanges => _firebaseAuth.userChanges().map<UserEntity>(UserEntity.fromFirebase);

  @override
  Future<UserEntity> googleSignIn() async {
    final googleSignIn = GoogleSignIn(
      scopes: _kGoogleSignInScopes,
      signInOption: SignInOption.standard,
    );

    l.vvvvv('Beginning interactive google sign in');
    // Trigger the authentication flow
    final googleUser = await googleSignIn.signIn();

    if (googleUser is! GoogleSignInAccount) {
      return const UserEntity.unauthenticated();
    }

    l.vvvvv('Getting google authentication credentials');
    // Obtain the auth details from the request
    final googleAuth = await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    l.vvvvv('Finishing google sign in');
    // Once signed in, return the UserCredential
    final userCredential = await _firebaseAuth.signInWithCredential(credential);

    return UserEntity.fromFirebase(userCredential.user);
  }

  @override
  Future<void> logOut() => _firebaseAuth.signOut();
}
