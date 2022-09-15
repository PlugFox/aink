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

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (context, constraints) {
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
              final cardsPadding = previewCards.isEmpty ? .0 : padding;
              final previewSize = math.min(
                maxImageSize,
                previewCards.isEmpty
                    ? .0
                    : (size.shortestSide - cardsPadding * (previewCards.length - 1)) / previewCards.length,
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
                  : math.max(cardSize, previewSize * previewCards.length + cardsPadding * (previewCards.length - 1));
              return Column(
                mainAxisSize: _expanded ? MainAxisSize.max : MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: promtHeight,
                    width: promtWidth,
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
                  if (_expanded) const Spacer() else SizedBox(height: padding),
                  Align(
                    alignment: Alignment.topCenter,
                    child: _PromtLayoutCards(
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
                      size: size,
                      cardSize: cardSize,
                      previewSize: previewSize,
                      padding: cardsPadding,
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

class _PromtLayoutCards extends StatelessWidget {
  // ignore: unused_element
  const _PromtLayoutCards({
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
