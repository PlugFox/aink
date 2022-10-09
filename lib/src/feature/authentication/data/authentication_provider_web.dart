import 'package:firebase_auth/firebase_auth.dart';
import 'package:l/l.dart';

import '../model/user_entity.dart';
import 'authentication_provider.dart';

const List<String> _kGoogleSignInScopes = <String>[
  'email',
  'profile',
  // 'https://www.googleapis.com/auth/contacts.readonly',
];

IAuthenticationProvider $createAuthenticationProvider({required FirebaseAuth firebaseAuth}) =>
    AuthenticationProviderWeb(firebaseAuth: firebaseAuth);

class AuthenticationProviderWeb implements IAuthenticationProvider {
  AuthenticationProviderWeb({required FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  @override
  UserEntity get currentUser => UserEntity.fromFirebase(_firebaseAuth.currentUser);

  @override
  Stream<UserEntity> get userChanges => _firebaseAuth.userChanges().map<UserEntity>(UserEntity.fromFirebase);

  @override
  Future<UserEntity> signInWithGoogle() async {
    // Create a new provider
    final googleProvider = GoogleAuthProvider()..scopes.addAll(_kGoogleSignInScopes);

    l.vvvvv('Interactively signing in with google');
    // Once signed in, return the UserCredential
    // Pop up
    final userCredential = await _firebaseAuth.signInWithPopup(googleProvider);
    // Redirect
    //await _firebaseAuth.signInWithRedirect(googleProvider);
    //final userCredential = await _firebaseAuth.getRedirectResult();

    return UserEntity.fromFirebase(userCredential.user);
  }

  @override
  Future<UserEntity> signInWithGitHub() async {
    // Create a new provider
    final githubProvider = GithubAuthProvider();

    // Once signed in, return the UserCredential
    final userCredential = await FirebaseAuth.instance.signInWithPopup(githubProvider);
    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(githubProvider);

    return UserEntity.fromFirebase(userCredential.user);
  }

  @override
  Future<void> logOut() => _firebaseAuth.signOut();
}
