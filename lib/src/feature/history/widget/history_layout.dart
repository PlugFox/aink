import 'package:flutter/material.dart';

/// {@template history_layout}
/// HistoryLayout widget
/// {@endtemplate}
class HistoryLayout extends StatelessWidget {
  /// {@macro history_layout}
  HistoryLayout({required this.children, super.key}) : assert(children.isNotEmpty, 'children must not be empty');

  final List<Widget> children;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: LayoutBuilder(
              builder: (context, constraints) {
                //final biggest = constraints.biggest;
                //final dimension = biggest.shortestSide - 8;
                final height =
                    ((constraints.biggest.shortestSide + constraints.biggest.height) / (children.length * 2)) - 16;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (var i = 0; i < children.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          height: height,
                          width: (constraints.biggest.width + constraints.biggest.shortestSide) / 2,
                          child: children[i],
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      );
}
