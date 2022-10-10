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
            // Can place all images in all available space
            final isBigScreen = size.longestSide >= imageMaxSize * imageMaxCount + 8 * (imageMaxCount - 1);

            // Can place effectivle all images
            final longScreen = size.shortestSide * .75 < (size.longestSide - 8 * (imageMaxCount - 1)) / imageMaxCount;

            final useFlex = isBigScreen || longScreen;
            if (useFlex) return _buildFlexImages(context, state, constraints.biggest);

            // TODO: square layout
            // Matiunin Mikhail <plugfox@gmail.com>, 11 October 2022
            return const Placeholder();
          },
        ),
      );

  // TODO: equal callbacks for all images
  // Matiunin Mikhail <plugfox@gmail.com>, 11 October 2022
  Widget _buildFlexImages(BuildContext context, PromtState state, Size size) => size.aspectRatio > 1
      ? Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            for (var i = 0; i < 4; i++)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(i == 0 ? 0 : 4, 4, i == 3 ? 0 : 4, 4),
                  child: Center(
                    child: SizedBox.square(
                      dimension: 512,
                      child: RepaintBoundary(
                        key: ValueKey<String>('imageCard#$i'),
                        child: _buildImage(context, state, 0),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        )
      : Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            for (var i = 0; i < 4; i++)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(4, i == 0 ? 0 : 4, 4, i == 3 ? 0 : 4),
                  child: Center(
                    child: SizedBox.square(
                      dimension: 512,
                      child: RepaintBoundary(
                        key: ValueKey<String>('imageCard#$i'),
                        child: _buildImage(context, state, 0),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );

  // TODO: Hero animation
  // Matiunin Mikhail <plugfox@gmail.com>, 11 October 2022
  static Widget _buildImage(BuildContext context, PromtState state, int index) {
    final preview = index != 0;
    if (state.isProcessing) return PromtImageCard.loading(preview: preview);
    final image = state.data.images?.skip(index).firstOrNull;
    if (image == null) return PromtImageCard.empty(preview: preview);
    return PromtImageCard(
      image: image,
      preview: preview,
      onTap: index == 0
          ? () {
              Navigator.push<void>(
                context,
                PageRouteBuilder<void>(
                  pageBuilder: (context, _, __) => PhotoViewScreen(image: image),
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
          : () {
              FocusScope.of(context).unfocus();
              HapticFeedback.lightImpact().ignore();
              Dependencies.instance.promtBLoC.add(PromtEvent.focus(index: index));
            },
    );
  }
}
