import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../common/util/screen_util.dart';

/// {@template promt_layout}
/// PromtLayout widget
/// {@endtemplate}
class PromtLayout extends StatelessWidget {
  /// {@macro promt_layout}
  const PromtLayout.compact({
    required this.promtInput,
    required this.promtSend,
    required this.imageCard,
    required this.previewCards,
    super.key,
  }) : _expanded = false;

  const PromtLayout.expanded({
    required this.promtInput,
    required this.promtSend,
    required this.imageCard,
    required this.previewCards,
    super.key,
  }) : _expanded = true;

  final bool _expanded;
  final Widget promtInput;
  final Widget promtSend;
  final Widget imageCard;
  final List<Widget> previewCards;

  static PromtLayoutConstraints getPromtLayoutConstraints(BoxConstraints constraints, {int previewCardsCount = 4}) {
    const maxImageSize = 512.0;
    final padding = ScreenUtil.from(constraints.biggest).when<double>(
      extraSmall: () => 16,
      small: () => 24,
      medium: () => 32,
      large: () => 48,
      extraLarge: () => 64,
    );
    const promtHeight = 48.0;
    final size = Size(
      constraints.biggest.width,
      constraints.biggest.height - promtHeight - padding,
    );
    final cardsPadding = previewCardsCount < 1 ? .0 : padding;
    final previewSize = math.min(
      maxImageSize,
      previewCardsCount < 1 ? .0 : (size.shortestSide - cardsPadding * (previewCardsCount - 1)) / previewCardsCount,
    );
    final cardSize = math.min(
      maxImageSize,
      math.min(
        size.shortestSide,
        size.longestSide - previewSize - cardsPadding,
      ),
    );
    final promtWidth = size.aspectRatio > 1
        ? previewSize + cardsPadding + cardSize
        : math.max(cardSize, previewSize * previewCardsCount + cardsPadding * (previewCardsCount - 1));
    return PromtLayoutConstraints(
      size: size,
      maxImageSize: maxImageSize,
      padding: padding,
      promtHeight: promtHeight,
      promtWidth: promtWidth,
      cardSize: cardSize,
      previewSize: previewSize,
      cardsPadding: cardsPadding,
    );
  }

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final layoutConstraints = getPromtLayoutConstraints(constraints, previewCardsCount: previewCards.length);
              return Column(
                mainAxisSize: _expanded ? MainAxisSize.max : MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: layoutConstraints.promtHeight,
                    width: layoutConstraints.promtWidth,
                    child: Hero(
                      tag: 'Hero#promtInput',
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                            child: promtInput,
                          ),
                          const SizedBox(width: 16),
                          SizedBox.square(
                            dimension: 48,
                            child: promtSend,
                          )
                        ],
                      ),
                    ),
                  ),
                  if (_expanded) const Spacer() else SizedBox(height: layoutConstraints.padding),
                  Align(
                    alignment: Alignment.topCenter,
                    child: PromtLayoutCards(
                      imageCard: Hero(
                        tag: 'Hero#imageCard',
                        child: imageCard,
                      ),
                      previewCards: <Widget>[
                        for (var i = 0; i < previewCards.length; i++)
                          Hero(
                            tag: 'Hero#previewCards#$i',
                            child: previewCards[i],
                          ),
                      ],
                      size: layoutConstraints.size,
                      cardSize: layoutConstraints.cardSize,
                      previewSize: layoutConstraints.previewSize,
                      padding: layoutConstraints.cardsPadding,
                    ),
                  ),
                  if (_expanded) const Spacer(),
                ],
              );
            },
          ),
        ),
      );
}

class PromtLayoutCards extends StatelessWidget {
  // ignore: unused_element
  const PromtLayoutCards({
    required this.imageCard,
    required this.previewCards,
    required this.size,
    required this.previewSize,
    required this.cardSize,
    required this.padding,
  });

  final Widget imageCard;
  final List<Widget> previewCards;
  final Size size;
  final double previewSize;
  final double cardSize;
  final double padding;

  @override
  Widget build(BuildContext context) {
    final vertical = size.height > size.width;
    return SizedBox(
      width: vertical ? size.width : previewSize + padding + cardSize,
      height: vertical ? previewSize + padding + cardSize : size.height,
      child: Stack(
        alignment: Alignment.center,
        children: vertical
            ? <Widget>[
                AnimatedPositioned(
                  key: const ValueKey('Positioned#ImageCard'),
                  duration: const Duration(milliseconds: 450),
                  top: 0,
                  width: cardSize,
                  height: cardSize,
                  curve: Curves.easeInOut,
                  child: imageCard,
                ),
                for (var i = 0; i < previewCards.length; i++)
                  AnimatedPositioned(
                    key: ValueKey('Positioned#PreviewCard$i'),
                    duration: const Duration(milliseconds: 450),
                    bottom: 0,
                    left: i * (previewSize + padding),
                    width: previewSize,
                    height: previewSize,
                    curve: Curves.easeInOut,
                    child: previewCards[i],
                  ),
              ]
            : <Widget>[
                AnimatedPositioned(
                  key: const ValueKey('Positioned#ImageCard'),
                  right: 0,
                  width: cardSize,
                  height: cardSize,
                  duration: const Duration(milliseconds: 450),
                  curve: Curves.easeInOut,
                  child: imageCard,
                ),
                for (var i = 0; i < previewCards.length; i++)
                  AnimatedPositioned(
                    key: ValueKey('Positioned#PreviewCard$i'),
                    duration: const Duration(milliseconds: 450),
                    left: 0,
                    top: i * (previewSize + padding),
                    width: previewSize,
                    height: previewSize,
                    curve: Curves.easeInOut,
                    child: previewCards[i],
                  ),
              ],
      ),
    );
  }
}

@immutable
class PromtLayoutConstraints {
  const PromtLayoutConstraints({
    required this.size,
    required this.maxImageSize,
    required this.padding,
    required this.promtHeight,
    required this.promtWidth,
    required this.cardSize,
    required this.previewSize,
    required this.cardsPadding,
  });

  final Size size;
  final double maxImageSize;
  final double padding;
  final double promtHeight;
  final double promtWidth;
  final double cardSize;
  final double previewSize;
  final double cardsPadding;
}
