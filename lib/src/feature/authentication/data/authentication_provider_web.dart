import 'package:firebase_auth/firebase_auth.dart';
import 'package:l/l.dart';

import 'authentication_provider.dart';

const List<String> _kGoogleSignInScopes = <String>[
  'email',
  'profile',
  // 'https://www.googleapis.com/auth/contacts.readonly',
];

IAuthenticationProvider $createAuthenticationProvider({required FirebaseAuth firebaseAuth}) =>
    AuthenticationProviderWeb(firebaseAuth: firebaseAuth);

class AuthenticationProviderWeb with _AuthenticationProviderMixin implements IAuthenticationProvider {
  AuthenticationProviderWeb({required FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Stream<User?> get userChanges => _firebaseAuth.userChanges();

  @override
  Future<UserCredential> signInWithGoogle({String? loginHint}) => _linkOnIfAccountAlreadyExists(() async {
        // Create a new provider
        final googleProvider = GoogleAuthProvider()
          ..scopes.addAll(_kGoogleSignInScopes)
          ..setCustomParameters(<String, String>{if (loginHint != null) 'login_hint': loginHint});

        l.vvvvv('Interactively signing in with google');
        // Once signed in, return the UserCredential
        // Pop up
        final userCredential = await _firebaseAuth.signInWithPopup(googleProvider);
        // Redirect
        //await _firebaseAuth.signInWithRedirect(googleProvider);
        //final userCredential = await _firebaseAuth.getRedirectResult();

        return userCredential;
      });

  @override
  Future<UserCredential> signInWithGitHub() => _linkOnIfAccountAlreadyExists(() async {
        // Create a new provider
        final githubProvider = GithubAuthProvider();

        // Once signed in, return the UserCredential
        final userCredential = await FirebaseAuth.instance.signInWithPopup(githubProvider);
        // Or use signInWithRedirect
        // return await FirebaseAuth.instance.signInWithRedirect(githubProvider);

        return userCredential;
      });

  @override
  Future<void> logOut() => _firebaseAuth.signOut();
}

mixin _AuthenticationProviderMixin implements IAuthenticationProvider {
  Future<UserCredential> _linkOnIfAccountAlreadyExists(Future<UserCredential> Function() fn) async {
    try {
      return await fn();
    } on FirebaseAuthException catch (error) {
      if (!error.code.contains('account-exists-with-different-credential')) {
        l.w('Firebase auth error, with code "${error.code}" and message "${error.message}"');
        rethrow;
      }
      final credential = error.credential;
      final email = error.email;
      l.i(
        'An account already exists with the same email address but different sign-in credentials. '
        'Sign in using a provider associated with this email address. '
        'Email: $email, Credential: ${credential?.providerId}',
      );
      if (credential == null || email == null) {
        l.w('Credential or/and email is null');
        rethrow;
      }
      final methods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (methods.isEmpty) {
        l.w('No provider found for email $email');
        rethrow;
      }

      /// providers returns this array -> ["google.com"]
      /// You need to sign in the user to that google account
      /// with the same email.
      /// In a browser you can call:
      /// var provider = new firebase.auth.GoogleAuthProvider();
      /// provider.setCustomParameters({login_hint: error.email});
      /// firebase.auth().signInWithPopup(provider)
      /// If you have your own mechanism to get that token, you get it
      /// for that Google email user and sign in
      final providers = methods.map<String>((e) => e.split('.').first.toLowerCase()).toList(growable: false);
      final UserCredential providerCredential;
      if (providers.contains('google')) {
        providerCredential = await signInWithGoogle(loginHint: email);
      } else if (providers.contains('github')) {
        providerCredential = await signInWithGitHub();
      } else {
        l.w('No supported provider found within $providers');
        rethrow;
      }
      final linkedCredential = await providerCredential.user?.linkWithCredential(credential);
      return linkedCredential ?? providerCredential;
    }
  }
}
