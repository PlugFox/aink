import 'package:flutter/material.dart';

/// {@template colored_card}
/// ColoredCard widget
/// {@endtemplate}
class ColoredCard extends StatelessWidget {
  /// {@macro colored_card}
  const ColoredCard({required this.color, super.key});

  final Color color;

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        elevation: 4,
        type: MaterialType.card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Ink(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      );
}
