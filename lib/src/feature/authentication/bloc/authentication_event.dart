part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const AuthenticationEvent._();
  const factory AuthenticationEvent.signInWithGoogle() = _GoogleSignIn;
  const factory AuthenticationEvent.signInWithGitHub() = _GitHubSignIn;
  const factory AuthenticationEvent.logOut() = _LogOut;
}
