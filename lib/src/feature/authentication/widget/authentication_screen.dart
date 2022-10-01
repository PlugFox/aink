import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          centerTitle: true,
        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              horizontal: math.max(24, (MediaQuery.of(context).size.width - 600) / 2),
              vertical: 16,
            ),
            children: <Widget>[
              if (state.isNotAuthenticated)
                ElevatedButton.icon(
                  key: const ValueKey<String>('google_sign_in_button'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffDF4A32),
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                  ),
                  onPressed: state.isProcessing ? null : onGoogleSignIn,
                  label: const Text('Login with Google'),
                  icon: const Icon(FontAwesomeIcons.google),
                ),
              if (state.isAuthenticated)
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                  ),
                  onPressed: state.isProcessing ? null : onLogOut,
                  label: const Text('Sign out'),
                  icon: const Icon(Icons.logout),
                ),
            ],
          ),
        ),
      );
}
