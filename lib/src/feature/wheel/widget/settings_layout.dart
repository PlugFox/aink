import 'package:flutter/material.dart';

/// {@template settings_layout}
/// SettingsLayout widget
/// {@endtemplate}
class SettingsLayout extends StatelessWidget {
  /// {@macro settings_layout}
  SettingsLayout({required this.children, super.key}) : assert(children.isNotEmpty, 'children must not be empty');

  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              //final biggest = constraints.biggest;
              //final dimension = biggest.shortestSide - 8;
              final height =
                  ((constraints.biggest.shortestSide + constraints.biggest.height) / (children.length * 2)) - 8;
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  for (var i = 0; i < children.length; i++)
                    SizedBox(
                      height: height,
                      width: (constraints.biggest.width + constraints.biggest.shortestSide) / 2,
                      child: children[i],
                    ),
                ],
              );
            },
          ),
        ),
      );
}
