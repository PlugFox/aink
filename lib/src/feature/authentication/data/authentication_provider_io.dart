import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:l/l.dart';

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
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Stream<User?> get userChanges => _firebaseAuth.userChanges();

  @override
  Future<UserCredential> signInWithGoogle({String? loginHint}) async {
    final googleSignIn = GoogleSignIn(
      scopes: _kGoogleSignInScopes,
      signInOption: SignInOption.standard,
    );

    l.vvvvv('Beginning interactive google sign in');
    // Trigger the authentication flow
    final googleUser = await googleSignIn.signIn();

    if (googleUser is! GoogleSignInAccount) {
      throw Exception('Google sign in failed');
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

    return userCredential;
  }

  @override
  Future<UserCredential> signInWithGitHub() async {
    throw UnimplementedError();
    /* // Create a GitHubSignIn instance
    final gitHubSignIn = GitHubSignIn(
      clientId: clientId,
      clientSecret: clientSecret,
      redirectUrl: 'https://my-project.firebaseapp.com/__/auth/handler',
    );

    // Trigger the sign-in flow
    final result = await gitHubSignIn.signIn(context);

    // Create a credential from the access token
    final githubAuthCredential = GithubAuthProvider.credential(result.token);

    // Once signed in, return the UserCredential
    final userCredential = await FirebaseAuth.instance.signInWithCredential(githubAuthCredential);

    return UserEntity.fromFirebase(userCredential.user); */
  }

  @override
  Future<void> logOut() => _firebaseAuth.signOut();
}
