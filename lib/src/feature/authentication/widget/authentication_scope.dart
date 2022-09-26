import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../bloc/authentication_bloc.dart';
import '../data/authentication_provider.dart';
import '../data/authentication_repository.dart';
import '../model/user_entity.dart';
import 'authentication_screen.dart';

/// {@template authentication_scope}
/// AuthenticationScope widget
/// {@endtemplate}
class AuthenticationScope extends StatefulWidget {
  /// {@macro authentication_scope}
  const AuthenticationScope({
    required this.child,
    super.key,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  /// e.g. `AuthenticationScope.maybeUserOf(context)`
  static UserEntity? maybeUserOf(BuildContext context) {
    final inhW = context.getElementForInheritedWidgetOfExactType<_InheritedAuthenticationScope>()?.widget;
    return inhW is _InheritedAuthenticationScope ? inhW.state.user : null;
  }

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a _InheritedAuthenticationScope of the exact type',
        'out_of_scope',
      );

  /// The state from the closest instance of this class
  /// that encloses the given context.
  /// e.g. `AuthenticationScope.userOf(context)`
  static UserEntity userOf(BuildContext context) => maybeUserOf(context) ?? _notFoundInheritedWidgetOfExactType();

  @override
  State<AuthenticationScope> createState() => _AuthenticationScopeState();
}

/// State for widget AuthenticationScope
class _AuthenticationScopeState extends State<AuthenticationScope> {
  final AuthenticationBloc _bloc = AuthenticationBloc(
    repository: AuthenticationRepositoryImpl(
      authenticationProvider: AuthenticationProviderFactory().create(
        firebaseAuth: FirebaseAuth.instance,
      ),
    ),
  );

  late AuthenticationState _state = _bloc.state;
  UserEntity get user => _bloc.state.user;
  late StreamSubscription<AuthenticationState> _userChangesSubscription;

  @override
  void initState() {
    super.initState();
    _userChangesSubscription = _bloc.stream.listen((state) {
      if (_state == state) return;
      setState(() => _state = state);
    });
  }

  @override
  void dispose() {
    _userChangesSubscription.cancel();
    _bloc.close();
    super.dispose();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) => super.debugFillProperties(
        properties
          ..add(
            StringProperty(
              'User',
              user.toString(),
            ),
          ),
      );

  @override
  Widget build(BuildContext context) => _InheritedAuthenticationScope(
        state: _state,
        child: _state.maybeMap<Widget>(
          orElse: () => AuthenticationScreen(
            state: _state,
            onGoogleSignIn: () => _bloc.add(const AuthenticationEvent.googleSignIn()),
            onLogOut: () => _bloc.add(const AuthenticationEvent.logOut()),
          ),
          authenticated: (state) => widget.child,
        ),
      );
}

/// Inherited widget for quick access in the element tree
class _InheritedAuthenticationScope extends InheritedWidget {
  const _InheritedAuthenticationScope({
    required this.state,
    required super.child,
  });

  final AuthenticationState state;

  @override
  bool updateShouldNotify(covariant _InheritedAuthenticationScope oldWidget) => state != oldWidget.state;
}
