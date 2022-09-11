import 'package:flutter/material.dart';

/// {@template gallery_layout}
/// GalleryLayout widget
/// {@endtemplate}
class GalleryLayout extends StatelessWidget {
  /// {@macro gallery_layout}
  GalleryLayout({required this.children, super.key}) : assert(children.isNotEmpty, 'children must not be empty');

  final List<Widget> children;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final biggest = constraints.biggest;
                final vertical = biggest.height > biggest.width;
                return Flex(
                  direction: vertical ? Axis.vertical : Axis.horizontal,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (var i = 0; i < children.length; i += 2)
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Flex(
                          direction: vertical ? Axis.horizontal : Axis.vertical,
                          children: <Widget>[
                            Expanded(
                              child: Center(
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: children[i],
                                ),
                              ),
                            ),
                            if (i + 1 < children.length) ...<Widget>[
                              const SizedBox.square(dimension: 16),
                              if (i + 1 < children.length)
                                Expanded(
                                  child: Center(
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: children[i + 1],
                                    ),
                                  ),
                                ),
                            ],
                          ],
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
