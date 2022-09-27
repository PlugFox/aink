import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:l/l.dart';
import 'package:stream_bloc/stream_bloc.dart';

import '../../../common/util/timeouts.dart';
import '../data/authentication_repository.dart';
import '../model/user_entity.dart';

part 'authentication_bloc.freezed.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBLoC extends StreamBloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBLoC({required IAuthenticationRepository repository})
      : _repository = repository,
        super(AuthenticationState.fromUser(repository.currentUser)) {
    _userChangesSubscription = repository.userChanges.listen(_emitUser);
  }

  final IAuthenticationRepository _repository;
  late final StreamSubscription<UserEntity> _userChangesSubscription;

  @override
  Stream<AuthenticationState> mapEventToStates(AuthenticationEvent event) => event.map<Stream<AuthenticationState>>(
        googleSignIn: _googleSignIn,
        logOut: _logOut,
      );

  Stream<AuthenticationState> _googleSignIn(_GoogleSignIn event) async* {
    var user = state.user;
    try {
      yield AuthenticationState.processing(user: user);
      user = await _repository.googleSignIn();
    } on FirebaseAuthException catch (error) {
      if (error.code == 'popup-closed-by-user') {
        l.i('The user closed the authentication window');
        return;
      }
      emit(AuthenticationState.error(user: user, message: 'Firebase exception occurred during Google authentication'));
      rethrow;
    } on Object {
      yield AuthenticationState.error(user: user);
      rethrow;
    } finally {
      _emitUser(user);
    }
  }

  Stream<AuthenticationState> _logOut(_LogOut event) async* {
    var user = state.user;
    try {
      yield AuthenticationState.processing(user: user);
      await _repository.logOut().logicTimeout();
      user = const UserEntity.unauthenticated();
    } on Object {
      yield AuthenticationState.error(user: user, message: 'An error occurred during log out');
      rethrow;
    } finally {
      _emitUser(user);
    }
  }

  void _emitUser(UserEntity user) {
    final newState = AuthenticationState.fromUser(user);
    if (state == newState) return;
    emit(newState);
  }

  @override
  FutureOr<void> close() async {
    await _userChangesSubscription.cancel();
    return super.close();
  }
}
