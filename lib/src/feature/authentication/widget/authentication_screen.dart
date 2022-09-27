import 'package:flutter/material.dart';

import '../bloc/authentication_bloc.dart';

/// {@template authentication_screen}
/// AuthenticationScreen widget
/// {@endtemplate}
class AuthenticationScreen extends StatelessWidget {
  /// {@macro authentication_screen}
  const AuthenticationScreen({
    required this.state,
    required this.onGoogleSignIn,
    required this.onLogOut,
    super.key,
  });

  final AuthenticationState state;
  final void Function() onGoogleSignIn;
  final void Function() onLogOut;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Authentication'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('${state.user}'),
              if (state.isNotAuthenticated)
                ElevatedButton(
                  onPressed: state.isProcessing ? null : onGoogleSignIn,
                  child: const Text('Log in with Google'),
                ),
              if (state.isAuthenticated)
                ElevatedButton(
                  onPressed: state.isProcessing ? null : onLogOut,
                  child: const Text('Log out'),
                ),
            ],
          ),
        ),
      );
}
