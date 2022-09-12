import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../../common/constant/assets.gen.dart';

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
                  //initialScale: PhotoViewComputedScale.contained,
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: 3.0,
                  enableRotation: false,
                  backgroundDecoration: const BoxDecoration(color: Colors.transparent),
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
              if (Navigator.canPop(context))
                SafeArea(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox.square(
                        dimension: 48,
                        child: Material(
                          color: Theme.of(context).primaryColor,
                          shape: const CircleBorder(),
                          elevation: 4,
                          child: InkWell(
                            onTap: () => Navigator.maybePop(context),
                            //borderRadius: const BorderRadius.all(Radius.circular(24)),
                            customBorder: const CircleBorder(),
                            child: Icon(Icons.adaptive.arrow_back),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
}


/* Ink(
  padding: EdgeInsets.zero,
  decoration: ShapeDecoration(
    color: Theme.of(context).primaryColor,
    shadows: kElevationToShadow[2],
    shape: const CircleBorder(),
  ),
  child: Material(
    color: Colors.red,
    child: Center(
      child: IconButton(
        onPressed: () => Navigator.maybePop(context),
        icon: Icon(Icons.adaptive.arrow_back),
      ),
    ),
  ),
), */