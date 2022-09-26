part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  AuthenticationEvent._();
  const factory AuthenticationEvent.googleSignIn() = _GoogleSignIn;
  const factory AuthenticationEvent.logOut() = _LogOut;
}
