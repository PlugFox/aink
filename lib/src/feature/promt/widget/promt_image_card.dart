import 'package:flutter/material.dart';

import '../../../common/constant/assets.gen.dart';

/// {@template promt_image_card}
/// PromtImageCard widget
/// {@endtemplate}
class PromtImageCard extends StatelessWidget {
  /// {@macro promt_image_card}
  const PromtImageCard({
    super.key,
    this.image,
    this.onTap,
  });

  final String? image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => SizedBox.square(
        dimension: 512,
        child: Align(
          alignment: Alignment.topCenter,
          child: AspectRatio(
            aspectRatio: 1,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(16),
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: (image == null ? AssetImage(Assets.image.sunflower512x512.path) : NetworkImage(image!))
                            as ImageProvider<Object>,
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: onTap,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
