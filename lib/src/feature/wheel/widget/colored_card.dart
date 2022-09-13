import 'package:flutter/material.dart';

/// {@template colored_card}
/// ColoredCard widget
/// {@endtemplate}
class ColoredCard extends StatelessWidget {
  /// {@macro colored_card}
  const ColoredCard.compact({
    required this.color,
    this.child,
    super.key,
  }) : animation = null;

  /// {@macro colored_card}
  const ColoredCard.expanded({
    required this.color,
    required this.animation,
    required this.child,
    super.key,
  });

  final Color color;
  final Widget? child;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        elevation: 4,
        type: MaterialType.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: _buildChild(context, animation, child),
      );

  Widget _buildChild(
    BuildContext context,
    Animation<double>? animation,
    Widget? child,
  ) =>
      animation == null
          ? child ??
              Ink(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(16),
                ),
              )
          : AnimatedBuilder(
              animation: animation,
              builder: (context, child) => Ink(
                decoration: BoxDecoration(
                  color: Color.lerp(color, Colors.transparent, animation.value),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: child,
              ),
              child: child,
            );
}
