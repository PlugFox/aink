import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../promt/widget/promt_layout.dart';
import '../../promt/widget/promt_screen.dart';
import '../../settings/widget/settings_screen.dart';
import 'colored_card.dart';
import 'gallery_layout.dart';
import 'settings_layout.dart';
import 'wheel_controller.dart';

/// {@template wheel_pages}
/// WheelPages widget
/// {@endtemplate}
class WheelPages extends StatelessWidget {
  /// {@macro wheel_pages}
  const WheelPages({required this.controller, super.key});

  final WheelController controller;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Positioned.fill(
              key: const ValueKey<String>('WheelPages_PageView'),
              child: PageView(
                controller: controller,
                scrollBehavior: _WheelScrollBehavior(),
                physics: const ClampingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                children: <Widget>[
                  _WheelPageConstraints(
                    onTap: () {
                      HapticFeedback.lightImpact().ignore();
                    },
                    child: GalleryLayout(
                      children: const <Widget>[
                        ColoredCard.compact(
                          color: Colors.red,
                        ),
                        ColoredCard.compact(
                          color: Colors.green,
                        ),
                        ColoredCard.compact(
                          color: Colors.blue,
                        ),
                        ColoredCard.compact(
                          color: Colors.orange,
                        ),
                        ColoredCard.compact(
                          color: Colors.pink,
                        ),
                        ColoredCard.compact(
                          color: Colors.purple,
                        ),
                      ],
                    ),
                  ),
                  _WheelPageConstraints(
                    onTap: () {
                      Navigator.push<void>(
                        context,
                        PageRouteBuilder<void>(
                          pageBuilder: (context, _, __) => const PromtScreen(),
                          transitionsBuilder: (
                            context,
                            animation,
                            secondayAnimation,
                            child,
                          ) =>
                              ScaleTransition(
                            scale: Tween<double>(begin: 1.25, end: 1).animate(animation),
                            child: FadeTransition(
                              opacity: animation.drive(CurveTween(curve: Curves.easeIn)),
                              child: child,
                            ),
                          ),
                          settings: const RouteSettings(name: 'promt'),
                        ),
                      );
                      HapticFeedback.lightImpact().ignore();
                    },
                    child: const PromtLayout.compact(
                      promtInput: ColoredCard.compact(
                        color: Colors.red,
                      ),
                      promtSend: ColoredCard.compact(
                        color: Colors.green,
                      ),
                      imageCard: ColoredCard.compact(
                        color: Colors.blue,
                      ),
                      previewCards: <Widget>[
                        ColoredCard.compact(
                          color: Colors.orange,
                        ),
                        ColoredCard.compact(
                          color: Colors.pink,
                        ),
                        ColoredCard.compact(
                          color: Colors.purple,
                        ),
                      ],
                    ),
                  ),
                  _WheelPageConstraints(
                    onTap: () {
                      Navigator.push<void>(
                        context,
                        PageRouteBuilder<void>(
                          pageBuilder: (context, _, __) => const SettingsScreen(),
                          transitionsBuilder: (
                            context,
                            animation,
                            secondayAnimation,
                            child,
                          ) =>
                              ScaleTransition(
                            scale: Tween<double>(begin: 1.25, end: 1).animate(animation),
                            child: FadeTransition(
                              opacity: animation.drive(CurveTween(curve: Curves.easeIn)),
                              child: child,
                            ),
                          ),
                          settings: const RouteSettings(name: 'settings'),
                        ),
                      );
                      HapticFeedback.lightImpact().ignore();
                    },
                    child: SettingsLayout(
                      children: const <Widget>[
                        ColoredCard.compact(
                          color: Colors.red,
                        ),
                        ColoredCard.compact(
                          color: Colors.green,
                        ),
                        ColoredCard.compact(
                          color: Colors.blue,
                        ),
                        ColoredCard.compact(
                          color: Colors.orange,
                        ),
                        ColoredCard.compact(
                          color: Colors.pink,
                        ),
                        ColoredCard.compact(
                          color: Colors.purple,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (constraints.biggest.width > 800) ...<Widget>[
              Positioned(
                key: const ValueKey<String>('WheelPages_LeftButton'),
                left: 24,
                top: constraints.biggest.height / 2 - 24,
                width: 48,
                height: 48,
                child: ValueListenableBuilder<double>(
                  valueListenable: controller,
                  builder: (context, value, _) => IconButton(
                    onPressed: value.round() != value || value == 0
                        ? null
                        : () =>
                            controller.previousPage(duration: const Duration(milliseconds: 450), curve: Curves.easeIn),
                    icon: const Align(alignment: Alignment.centerLeft, child: Icon(Icons.chevron_left)),
                    padding: EdgeInsets.zero,
                    iconSize: 45,
                  ),
                ),
              ),
              Positioned(
                key: const ValueKey<String>('WheelPages_RightButton'),
                right: 24,
                top: constraints.biggest.height / 2 - 24,
                width: 48,
                height: 48,
                child: ValueListenableBuilder<double>(
                  valueListenable: controller,
                  builder: (context, value, _) => IconButton(
                    onPressed: value.round() != value || value + 1 >= controller.total
                        ? null
                        : () => controller.nextPage(duration: const Duration(milliseconds: 450), curve: Curves.easeIn),
                    icon: const Align(alignment: Alignment.centerRight, child: Icon(Icons.chevron_right)),
                    padding: EdgeInsets.zero,
                    iconSize: 45,
                  ),
                ),
              ),
            ],
          ],
        ),
      );
}

class _WheelScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) =>
      child;
}

class _WheelPageConstraints extends StatelessWidget {
  const _WheelPageConstraints({required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final orientation =
              constraints.biggest.width > constraints.biggest.height ? Orientation.landscape : Orientation.portrait;
          return Padding(
            padding: const EdgeInsets.only(bottom: 85, top: 10),
            child: Center(
              child: ConstrainedBox(
                constraints: orientation == Orientation.landscape
                    ? BoxConstraints.tightFor(
                        width: math.min(600, constraints.biggest.width / 2),
                        height: math.min(400, constraints.biggest.height / 1.4),
                      )
                    : BoxConstraints.tightFor(
                        width: math.min(400, constraints.biggest.width / 1.4),
                        height: math.min(600, constraints.biggest.height / 2),
                      ),
                child: Center(
                  child: Card(
                    elevation: 16,
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: InkWell(
                      onTap: onTap,
                      borderRadius: BorderRadius.circular(32),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: AspectRatio(
                          aspectRatio: orientation == Orientation.portrait ? 0.7 : 1.4,
                          child: child,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
}
