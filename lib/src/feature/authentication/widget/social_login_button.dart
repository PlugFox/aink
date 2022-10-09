import 'package:flutter/material.dart';

/// {@template social_login_button}
/// SocialLoginIcon widget
/// {@endtemplate}
class SocialLoginButton extends StatelessWidget {
  /// {@macro social_login_button}
  const SocialLoginButton({
    required this.icon,
    this.color,
    this.onPressed,
    super.key,
  });

  /// The widget below this widget in the tree.
  final Widget icon;
  final Color? color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => SizedBox.square(
        dimension: 48,
        child: CircleAvatar(
          child: IconButton(
            color: color,
            onPressed: onPressed,
            icon: icon,
          ),
        ),
      );
}
