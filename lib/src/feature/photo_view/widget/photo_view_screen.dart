import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';

import '../../../common/constant/assets.gen.dart';
import '../../../common/util/screen_util.dart';

/// {@template photo_view_screen}
/// PhotoViewScreen widget
/// {@endtemplate}
class PhotoViewScreen extends StatelessWidget {
  /// {@macro photo_view_screen}
  const PhotoViewScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox.expand(
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: PhotoView.customChild(
                  basePosition: Alignment.center,
                  initialScale: PhotoViewComputedScale.contained,
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: 3.0,
                  enableRotation: false,
                  backgroundDecoration: const BoxDecoration(color: Colors.transparent),
                  child: SafeArea(
                    child: Center(
                      child: Hero(
                        tag: 'Hero#imageCard',
                        child: Image(
                          image: AssetImage(Assets.image.sunflower512x512.path),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (Navigator.canPop(context))
                ScreenUtil.screenSizeOf(context).maybeWhen(
                  extraSmall: () => const PhotoViewBackButton(),
                  orElse: () => const PhotoViewBackButton.large(),
                ),
            ],
          ),
        ),
      );
}

/// {@template photo_view_screen}
/// PhotoViewBackButton widget
/// {@endtemplate}
class PhotoViewBackButton extends StatelessWidget {
  /// {@macro photo_view_screen}
  const PhotoViewBackButton({super.key}) : _isLarge = false;

  /// {@macro photo_view_screen}
  const PhotoViewBackButton.large({super.key}) : _isLarge = true;

  final bool _isLarge;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox.square(
              dimension: _isLarge ? 82 : 48,
              child: Material(
                color: Theme.of(context).colorScheme.secondary,
                shape: const CircleBorder(),
                elevation: 4,
                child: InkWell(
                  onTap: () {
                    Navigator.maybePop(context);
                    HapticFeedback.lightImpact().ignore();
                  },
                  customBorder: const CircleBorder(),
                  child: Icon(
                    Icons.arrow_back,
                    size: _isLarge ? 48 : 32,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
