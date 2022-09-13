import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../promt/widget/promt_layout.dart';
import '../../promt/widget/promt_screen.dart';
import 'colored_card.dart';
import 'gallery_layout.dart';
import 'history_layout.dart';
import 'wheel_controller.dart';

/// {@template wheel_pages}
/// WheelPages widget
/// {@endtemplate}
class WheelPages extends StatelessWidget {
  /// {@macro wheel_pages}
  const WheelPages({required this.controller, super.key});

  final WheelController controller;

  @override
  Widget build(BuildContext context) => PageView(
        controller: controller,
        scrollBehavior: _WheelScrollBehavior(),
        physics: const ClampingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
              Navigator.of(context).push<void>(MaterialPageRoute<void>(builder: (context) => const PromtScreen()));
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
              HapticFeedback.lightImpact().ignore();
            },
            child: HistoryLayout(
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
      );
}

class _WheelScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) => child;
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
          return Center(
            child: ConstrainedBox(
              constraints: orientation == Orientation.landscape
                  ? BoxConstraints.tightFor(width: constraints.biggest.width / 2)
                  : BoxConstraints.tightFor(height: constraints.biggest.height / 2),
              child: Center(
                child: Card(
                  elevation: 16,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                  child: InkWell(
                    onTap: onTap,
                    borderRadius: BorderRadius.circular(32),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: AspectRatio(
                        aspectRatio: orientation == Orientation.portrait ? 0.6 : 1.4,
                        child: child,
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
