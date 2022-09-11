import 'package:flutter/material.dart';

import 'wheel_controller.dart';
import 'wheel_pages.dart';

/// {@template wheel}
/// Wheel widget
/// {@endtemplate}
class Wheel extends StatefulWidget {
  /// {@macro wheel}
  const Wheel({super.key});

  /* static double getBottomPadding(BuildContext context, [MediaQueryData? mediaQueryData]) =>
      ((mediaQueryData ?? MediaQuery.of(context)).size.height / 10).clamp(64, 128); */

  @override
  State<Wheel> createState() => _WheelState();
}

class _WheelState extends State<Wheel> {
  final WheelController _controller = WheelController(initialPage: 1);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => WheelPages(controller: _controller);

  /* @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final bottomPadding = Wheel.getBottomPadding(context, mediaQueryData);
    return MediaQuery(
      data: mediaQueryData.copyWith(
        padding: mediaQueryData.padding.copyWith(bottom: mediaQueryData.padding.bottom + bottomPadding),
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Center(child: WheelPages(controller: _controller)),
          ),
          Positioned(
            left: 0,
            right: 0,
            height: 20,
            bottom: 0,
            child: Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) => Text(_controller.page.toString()),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            height: bottomPadding,
            left: 0,
            right: 0,
            bottom: 0,
            child: WheelFooter(controller: _controller),
          ),
        ],
      ),
    );
  } */
}
