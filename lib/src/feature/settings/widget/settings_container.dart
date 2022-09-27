import 'package:flutter/material.dart';

/// {@template settings_container}
/// SettingsContainer widget
/// {@endtemplate}
class SettingsContainer extends StatelessWidget {
  /// {@macro settings_container}
  const SettingsContainer({required this.children, super.key});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) => SliverFixedExtentList(
        itemExtent: 64,
        delegate: SliverChildListDelegate.fixed(
          children,
        ),
      );
}
