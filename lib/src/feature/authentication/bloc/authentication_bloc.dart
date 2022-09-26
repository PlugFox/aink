import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stream_bloc/stream_bloc.dart';

import '../data/authentication_repository.dart';
import '../model/user_entity.dart';

part 'authentication_bloc.freezed.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends StreamBloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(IAuthenticationRepository repository)
      : _repository = repository,
        super(AuthenticationState.fromUser(repository.currentUser));

  final IAuthenticationRepository _repository;

  @override
  Stream<AuthenticationState> mapEventToStates(AuthenticationEvent event) =>
      event.map<Stream<AuthenticationState>>(googleSignIn: _googleSignIn, logOut: _logOut);

  Stream<AuthenticationState> _googleSignIn(_GoogleSignIn event) async* {
    try {
      yield AuthenticationState.processing(user: state.user);
      await _repository.googleSignIn();
    } on Object {
      //l.e('An error occurred in the AuthenticationBLoC: $err', stackTrace);
      yield AuthenticationState.error(user: state.user);
      rethrow;
    }
  }

  Stream<AuthenticationState> _logOut(_LogOut event) async* {
    try {
      yield AuthenticationState.processing(user: state.user);
      await _repository.logOut();
    } on Object {
      //l.e('An error occurred in the AuthenticationBLoC: $err', stackTrace);
      yield AuthenticationState.error(user: state.user);
      rethrow;
    }
  }
}
