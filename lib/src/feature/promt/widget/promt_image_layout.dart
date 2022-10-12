import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/initialization/dependencies.dart';
import '../../photo_view/widget/photo_view_screen.dart';
import '../bloc/promt_bloc.dart';
import 'promt_image_card.dart';

/// {@template promt_image_layout}
/// PromtImageLayout widget
/// {@endtemplate}
class PromtImageLayout extends StatelessWidget {
  /// {@macro promt_image_layout}
  const PromtImageLayout({
    required this.animation,
    super.key,
  });

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) => BlocBuilder<PromtBLoC, PromtState>(
        bloc: Dependencies.instance.promtBLoC,
        builder: (context, state) => LayoutBuilder(
          builder: (context, constraints) {
            const imageMaxCount = 4;
            const imageMaxSize = 512;
            final size = constraints.biggest;

            Widget layout() {
              // square layout
              if (size.shortestSide * 1.25 > size.longestSide || size.shortestSide > 520) {
                return _buildSquareLayout(context, state, size);
              }

              // Can place all images in all available space
              final isBigScreen = size.longestSide >= imageMaxSize * imageMaxCount;

              // Can place effectivle all images in a line
              final longScreen = size.shortestSide * .75 < (size.longestSide) / imageMaxCount;

              // line layout
              if (isBigScreen || longScreen) {
                return _buildLineLayout(context, state, size);
              }

              // rectangle layout
              return _buildRectangleLayout(context, state, size);
            }

            return layout();
          },
        ),
      );

  // Matiunin Mikhail <plugfox@gmail.com>, 11 October 2022
  /// Build line layout
  Widget _buildLineLayout(BuildContext context, PromtState state, Size size) {
    Widget buildImage(int index) => _buildMainImage(context, state, index);
    return size.aspectRatio > 1
        ? Row(
            key: const ValueKey<String>('images-layout-row'),
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              for (var i = 0; i < 4; i++)
                Expanded(
                  child: Center(
                    child: SizedBox.square(
                      dimension: 512,
                      child: RepaintBoundary(
                        key: ValueKey<String>('imageCard#$i'),
                        child: buildImage(i),
                      ),
                    ),
                  ),
                ),
            ],
          )
        : Column(
            key: const ValueKey<String>('images-layout-column'),
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              for (var i = 0; i < 4; i++)
                Expanded(
                  child: Center(
                    child: SizedBox.square(
                      dimension: 512,
                      child: RepaintBoundary(
                        key: ValueKey<String>('imageCard#$i'),
                        child: buildImage(i),
                      ),
                    ),
                  ),
                ),
            ],
          );
  }

  /// Build square layout
  Widget _buildSquareLayout(BuildContext context, PromtState state, Size size) {
    final squareDimension = math.min<double>(size.shortestSide / 2 - 8, 512);
    final squareWidth = size.width / 2 - 8;
    final squareHeight = size.height / 2 - 8;
    const align = -.5;
    Widget buildImage(int index) => _buildMainImage(context, state, index);
    return Stack(
      key: const ValueKey<String>('images-layout-square'),
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          width: squareWidth,
          height: squareHeight,
          child: Align(
            alignment: const Alignment(-align, -align),
            child: SizedBox.square(
              dimension: squareDimension,
              child: RepaintBoundary(
                key: const ValueKey<String>('imageCard#0'),
                child: buildImage(0),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          width: squareWidth,
          height: squareHeight,
          child: Align(
            alignment: const Alignment(align, -align),
            child: SizedBox.square(
              dimension: squareDimension,
              child: RepaintBoundary(
                key: const ValueKey<String>('imageCard#1'),
                child: buildImage(1),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          width: squareWidth,
          height: squareHeight,
          child: Align(
            alignment: const Alignment(-align, align),
            child: SizedBox.square(
              dimension: squareDimension,
              child: RepaintBoundary(
                key: const ValueKey<String>('imageCard#2'),
                child: buildImage(2),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          width: squareWidth,
          height: squareHeight,
          child: Align(
            alignment: const Alignment(align, align),
            child: SizedBox.square(
              dimension: squareDimension,
              child: RepaintBoundary(
                key: const ValueKey<String>('imageCard#3'),
                child: buildImage(3),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRectangleLayout(BuildContext context, PromtState state, Size size) {
    final mainSize = size.shortestSide;
    const padding = 16.0;
    final previewSize = math.min<double>(size.longestSide - mainSize - padding, (mainSize - padding * 2) / 3);
    Widget buildMainImage() => _buildMainImage(context, state, 0);
    Widget buildPreviewImage(int index) => _buildPreviewImage(context, state, index);
    return (size.width > size.height)
        ? Row(
            key: const ValueKey<String>('images-layout-horizontal-rectangle'),
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox.square(
                dimension: mainSize,
                child: RepaintBoundary(
                  key: const ValueKey<String>('imageCard#0'),
                  child: buildMainImage(),
                ),
              ),
              SizedBox(
                width: previewSize,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox.square(
                      dimension: previewSize,
                      child: RepaintBoundary(
                        key: const ValueKey<String>('imageCard#1'),
                        child: buildPreviewImage(1),
                      ),
                    ),
                    SizedBox.square(
                      dimension: previewSize,
                      child: RepaintBoundary(
                        key: const ValueKey<String>('imageCard#2'),
                        child: buildPreviewImage(2),
                      ),
                    ),
                    SizedBox.square(
                      dimension: previewSize,
                      child: RepaintBoundary(
                        key: const ValueKey<String>('imageCard#3'),
                        child: buildPreviewImage(3),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Column(
            key: const ValueKey<String>('images-layout-vertical-rectangle'),
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox.square(
                dimension: mainSize,
                child: RepaintBoundary(
                  key: const ValueKey<String>('imageCard#0'),
                  child: buildMainImage(),
                ),
              ),
              SizedBox(
                height: previewSize,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox.square(
                      dimension: previewSize,
                      child: RepaintBoundary(
                        key: const ValueKey<String>('imageCard#1'),
                        child: buildPreviewImage(1),
                      ),
                    ),
                    SizedBox.square(
                      dimension: previewSize,
                      child: RepaintBoundary(
                        key: const ValueKey<String>('imageCard#2'),
                        child: buildPreviewImage(2),
                      ),
                    ),
                    SizedBox.square(
                      dimension: previewSize,
                      child: RepaintBoundary(
                        key: const ValueKey<String>('imageCard#3'),
                        child: buildPreviewImage(3),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }

  static Widget _buildImage(PromtState state, int index, bool preview) {
    Widget buildImageState() {
      if (state.isProcessing) return PromtImageCard.loading(preview: preview);
      final image = state.data.images?.skip(index).firstOrNull;
      if (image == null) return PromtImageCard.empty(preview: preview);
      return Builder(
        builder: (context) => PromtImageCard(
          image: image,
          preview: preview,
          onTap: () => preview ? _focusImage(context, index) : _showFullScreenImage(context, index),
        ),
      );
    }

    return Hero(tag: 'Hero#imageCard#$index', child: buildImageState());
  }

  static Widget _buildMainImage(BuildContext context, PromtState state, int index) => _buildImage(state, index, false);

  static Widget _buildPreviewImage(BuildContext context, PromtState state, int index) =>
      _buildImage(state, index, true);

  static void _showFullScreenImage(BuildContext context, int index) {
    Navigator.push<void>(
      context,
      PageRouteBuilder<void>(
        pageBuilder: (context, _, __) => PhotoViewScreen(index: index),
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
        settings: const RouteSettings(name: 'photo_view'),
      ),
    );
    FocusScope.of(context).unfocus();
    HapticFeedback.lightImpact().ignore();
  }

  static void _focusImage(BuildContext context, int index) {
    FocusScope.of(context).unfocus();
    HapticFeedback.lightImpact().ignore();
    Dependencies.instance.promtBLoC.add(PromtEvent.focus(index: index));
  }
}
