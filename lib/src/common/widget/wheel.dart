import 'package:flutter/material.dart';

/// {@template wheel}
/// Wheel widget
/// {@endtemplate}
class Wheel extends StatelessWidget {
  /// {@macro wheel}
  const Wheel({required this.child, super.key});

  static double getBottomPadding(BuildContext context, [MediaQueryData? mediaQueryData]) =>
      ((mediaQueryData ?? MediaQuery.of(context)).size.height / 10).clamp(64, 128);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final bottomPadding = getBottomPadding(context, mediaQueryData);
    return MediaQuery(
      data: mediaQueryData.copyWith(
        padding: mediaQueryData.padding.copyWith(bottom: mediaQueryData.padding.bottom + bottomPadding),
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: child,
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            height: bottomPadding,
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: SizedBox(
                width: 1240,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox.square(
                      dimension: 40,
                      child: Ink(
                        padding: EdgeInsets.zero,
                        decoration: ShapeDecoration(
                          color: Theme.of(context).primaryColor,
                          shadows: kElevationToShadow[2],
                          shape: const CircleBorder(),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.photo_album_outlined),
                            iconSize: 24,
                            splashRadius: 18,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ),
                    SizedBox.square(
                      dimension: 64,
                      child: Ink(
                        padding: EdgeInsets.zero,
                        decoration: ShapeDecoration(
                          color: Theme.of(context).primaryColor,
                          shadows: kElevationToShadow[4],
                          shape: const CircleBorder(),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.photo_outlined),
                            iconSize: 48,
                            splashRadius: 30,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ),
                    SizedBox.square(
                      dimension: 40,
                      child: Ink(
                        padding: EdgeInsets.zero,
                        decoration: ShapeDecoration(
                          color: Theme.of(context).primaryColor,
                          shadows: kElevationToShadow[2],
                          shape: const CircleBorder(),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.settings_outlined),
                            iconSize: 24,
                            splashRadius: 18,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
