import 'package:flutter/material.dart';
import 'package:flutter_batteries/flutter_batteries.dart';
import 'package:google_fonts/google_fonts.dart';

import 'wheel_controller.dart';

/// {@template wheel_title}
/// WheelTitle widget
/// {@endtemplate}
class WheelTitle extends StatelessWidget {
  /// {@macro wheel_title}
  const WheelTitle({required this.titles, required this.controller, super.key});

  final WheelController controller;
  final List<String> titles;

  @override
  Widget build(BuildContext context) => DefaultTextStyle(
        style: GoogleFonts.sofia(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 64,
          height: 1,
          fontWeight: FontWeight.w600,
        ),
        child: ValueListenableBuilder<String?>(
          valueListenable: controller.select<String?>(
            (controller) {
              final index = controller.page.round();
              if ((controller.page - index).abs() > 0.1 || (titles.length - 1) < index) return null;
              return titles[index];
            },
            (prev, next) => prev != next,
          ),
          builder: (context, value, child) => AnimatedSwitcher(
            duration: const Duration(milliseconds: 450),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation
                  .drive(CurveTween(curve: Curves.easeInOut))
                  .drive(CurveTween(curve: const Interval(.25, .75))),
              child: ScaleTransition(
                scale: animation.drive(CurveTween(curve: Curves.easeInOut)).drive(Tween(begin: .8, end: 1)),
                child: child,
              ),
            ),
            child: value == null
                ? const SizedBox.shrink()
                : Text(
                    ' $value ',
                    key: ValueKey<String>(value),
                  ),
          ),
        ),
      );
}
