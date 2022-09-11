import 'package:flutter/material.dart';

import '../../feature/gallery/widget/gallery_layout.dart';
import '../../feature/history/widget/history_layout.dart';
import '../../feature/promt/widget/promt_layout.dart';
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
          GalleryLayout(
            children: const <Widget>[
              _ColoredCard(
                color: Colors.red,
              ),
              _ColoredCard(
                color: Colors.green,
              ),
              _ColoredCard(
                color: Colors.blue,
              ),
              _ColoredCard(
                color: Colors.orange,
              ),
              _ColoredCard(
                color: Colors.pink,
              ),
              _ColoredCard(
                color: Colors.purple,
              ),
            ],
          ),
          const PromtLayout(
            promtInput: _ColoredCard(
              color: Colors.red,
            ),
            promtSend: _ColoredCard(
              color: Colors.green,
            ),
            imageCard: _ColoredCard(
              color: Colors.blue,
            ),
            previewCards: <Widget>[
              _ColoredCard(
                color: Colors.orange,
              ),
              _ColoredCard(
                color: Colors.pink,
              ),
              _ColoredCard(
                color: Colors.purple,
              ),
            ],
          ),
          HistoryLayout(
            children: const <Widget>[
              _ColoredCard(
                color: Colors.red,
              ),
              _ColoredCard(
                color: Colors.green,
              ),
              _ColoredCard(
                color: Colors.blue,
              ),
              _ColoredCard(
                color: Colors.orange,
              ),
              _ColoredCard(
                color: Colors.pink,
              ),
              _ColoredCard(
                color: Colors.purple,
              ),
            ],
          ),
          /* ColoredBox(
                  color: Colors.blue,
                  child: Center(
                    child: Text('Page 4'),
                  ),
                ),
                ColoredBox(
                  color: Colors.deepOrange,
                  child: Center(
                    child: Text('Page 5'),
                  ),
                ), */
        ],
      );
}

class _WheelScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) => child;
}

class _ColoredCard extends StatelessWidget {
  // ignore: unused_element
  const _ColoredCard({required this.color, super.key});

  final Color color;

  @override
  Widget build(BuildContext context) => Card(
        color: color,
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: ColoredBox(
            color: color,
          ),
        ),
      );
}
