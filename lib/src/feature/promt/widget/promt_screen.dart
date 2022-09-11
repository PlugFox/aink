import 'package:flutter/material.dart';

import '../../wheel/widget/colored_card.dart';
import '../../wheel/widget/promt_layout.dart';

final GlobalKey promtScreenKey = GlobalKey();

/// {@template promt_screen}
/// PromtScreen widget
/// {@endtemplate}
class PromtScreen extends StatelessWidget {
  /// {@macro promt_screen}
  const PromtScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: const Center(
          child: PromtLayout(
            promtInput: ColoredCard(
              color: Colors.red,
            ),
            promtSend: ColoredCard(
              color: Colors.green,
            ),
            imageCard: ColoredCard(
              color: Colors.blue,
            ),
            previewCards: <Widget>[
              ColoredCard(
                color: Colors.orange,
              ),
              ColoredCard(
                color: Colors.pink,
              ),
              ColoredCard(
                color: Colors.purple,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Icon(Icons.adaptive.arrow_back),
        ),
      );
}
