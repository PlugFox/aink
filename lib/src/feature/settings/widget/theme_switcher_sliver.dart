import 'package:flutter/material.dart';

/// {@template theme_switcher_sliver}
/// ThemeSwitcherSliver widget
/// {@endtemplate}
class ThemeSwitcherSliver extends StatelessWidget {
  /// {@macro theme_switcher_sliver}
  const ThemeSwitcherSliver({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox(
        height: 100,
        child: ListTile(
          title: Text('Theme'),
          trailing: Switch(
            value: true,
            onChanged: null,
          ),
        ),
      );
}
