import 'dart:math' as math;
import 'dart:ui';

import 'package:blobs/blobs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/constant/assets.gen.dart';
import '../../../common/util/analytics.dart';
import '../bloc/authentication_bloc.dart';
import 'authentication_scope.dart';
import 'social_login_button.dart';

/// {@template authentication_screen}
/// AuthenticationScreen widget
/// {@endtemplate}
class AuthenticationScreen extends StatefulWidget {
  /// {@macro authentication_screen}
  const AuthenticationScreen({
    required this.state,
    super.key,
  });

  final AuthenticationState state;

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  void initState() {
    super.initState();
    Analytics.logScreenScope('authentication');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        /* appBar: AppBar(
          title: const Text('Authentication'),
          centerTitle: true,
        ), */
        body: Align(
          alignment: const Alignment(0, -.3),
          child: _AuthenticationScreenBody(state: widget.state),
        ),
      );
}

class _AuthenticationScreenBody extends StatelessWidget {
  const _AuthenticationScreenBody({required this.state});

  final AuthenticationState state;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(24),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final logoDimension = math.min(constraints.maxHeight - 48 - 48, constraints.maxWidth);
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                if (logoDimension > 95) ...<Widget>[
                  SizedBox.square(
                    key: const Key('authentication_logo'),
                    dimension: logoDimension,
                    child: _AuthenticationLogoWidget(size: logoDimension),
                  ),
                  SizedBox(width: (48 * 4 + 24 * 3 + logoDimension) / 2, child: const Divider(height: 48)),
                ],
                SizedBox(
                  key: const Key('authentication_social_buttons'),
                  height: 48,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SocialLoginButton(
                        key: const ValueKey<String>('social_login_button_google'),
                        icon: const Icon(FontAwesomeIcons.google),
                        onPressed: state.isProcessing || state.isAuthenticated
                            ? null
                            : () => AuthenticationScope.signInWithGoogle(context),
                      ),
                      const VerticalDivider(width: 24),
                      SocialLoginButton(
                        key: const ValueKey<String>('social_login_button_github'),
                        icon: const Icon(FontAwesomeIcons.github),
                        onPressed: state.isProcessing || state.isAuthenticated || !kIsWeb
                            ? null
                            : () => AuthenticationScope.signInWithGitHub(context),
                      ),
                      const VerticalDivider(width: 24),
                      const SocialLoginButton(
                        key: ValueKey<String>('social_login_button_twitter'),
                        icon: Icon(FontAwesomeIcons.twitter),
                        onPressed: null,
                      ),
                      const VerticalDivider(width: 24),
                      const SocialLoginButton(
                        key: ValueKey<String>('social_login_button_facebook'),
                        icon: Icon(FontAwesomeIcons.facebookF),
                        onPressed: null,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      );
}

/// {@template authentication_logo_widget}
/// _AuthenticationLogoWidget widget
/// {@endtemplate}
class _AuthenticationLogoWidget extends StatelessWidget {
  /// {@macro authentication_logo_widget}
  const _AuthenticationLogoWidget({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          Positioned.fill(
            key: ValueKey('authentication_logo_blob#${size.truncate()}'),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Blob.fromID(
                id: const <String>['3-5-80'],
                size: size * 1.15,
                styles: BlobStyles(
                  color: Theme.of(context).primaryColor,
                  fillType: BlobFillType.fill,
                ),
                child: const SizedBox.expand(),
              ),
            ),
          ),
          Positioned.fill(
            child: Center(
              child: SizedBox.square(
                dimension: size / 1.45,
                child: Assets.logo.iconAlfa512.image(
                  color: Colors.black26,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Align(
                alignment: const Alignment(-.15, -.25),
                child: SizedBox.square(
                  dimension: size / 1.5,
                  child: Assets.logo.iconAlfa512.image(),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: const Alignment(0, .75),
              child: Text(
                'Authentication',
                style: GoogleFonts.sofia(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: size / 10,
                  height: 1,
                  fontWeight: FontWeight.w600,
                ).copyWith(
                  shadows: [
                    const Shadow(
                      color: Colors.black26,
                      offset: Offset(6, 8),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
}
