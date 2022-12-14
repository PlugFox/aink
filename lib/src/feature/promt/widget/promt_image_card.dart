import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

import '../model/generated_image.dart';

/// {@template promt_image_card}
/// PromtImageCard widget
/// {@endtemplate}
class PromtImageCard extends StatelessWidget {
  /// {@macro promt_image_card}
  const PromtImageCard({
    required GeneratedImage image,
    required VoidCallback onTap,
    bool preview = false,
    super.key,
  })  : _image = image,
        _onTap = onTap,
        _loading = false,
        _preview = preview;

  /// {@macro promt_image_card}
  const PromtImageCard.empty({
    bool preview = false,
    super.key,
  })  : _image = null,
        _onTap = null,
        _loading = false,
        _preview = preview;

  /// {@macro promt_image_card}
  const PromtImageCard.loading({
    bool preview = false,
    super.key,
  })  : _image = null,
        _onTap = null,
        _loading = true,
        _preview = preview;

  final GeneratedImage? _image;
  final VoidCallback? _onTap;
  final bool _loading;
  final bool _preview;

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
                  child: _buildImage(),
                ),
              ),
            ),
          ),
        ),
      );

  Widget _buildImage() {
    final image = _image;
    if (_loading) {
      return Center(
        child: LayoutBuilder(
          builder: (context, constraints) => Blob.animatedRandom(
            duration: const Duration(milliseconds: 1000),
            size: constraints.biggest.shortestSide * 0.75,
            edgesCount: 5,
            minGrowth: 4,
            styles: BlobStyles(
              color: Theme.of(context).colorScheme.secondary,
            ),
            loop: true,
          ),
        ),
      );
      //return const Center(child: CircularProgressIndicator());
    } else if (image == null) {
      return const Center(child: Text('No image'));
    } else {
      return _PromtImageCardImage(image: image, onTap: _onTap, preview: _preview);
    }
  }
}

class _PromtImageCardImage extends StatelessWidget {
  const _PromtImageCardImage({required this.image, required this.onTap, required this.preview});

  final GeneratedImage image;
  final VoidCallback? onTap;
  final bool preview;

  @override
  Widget build(BuildContext context) => GridTile(
        footer: preview
            ? null
            : const GridTileBar(
                title: Text('title'),
                subtitle: Text('subtitle'),
                backgroundColor: Colors.black45,
                trailing: Icon(
                  Icons.launch,
                  color: Colors.white,
                ),
              ),
        child: Stack(
          children: <Widget>[
            if (image.blurhash != null)
              Positioned.fill(
                key: const ValueKey<String>('blurhash'),
                child: BlurHash(
                  hash: image.blurhash!,
                  imageFit: BoxFit.cover,
                ),
              ),
            Positioned.fill(
              key: const ValueKey<String>('image'),
              child: _buildImage(image),
            ),
            Positioned.fill(
              key: const ValueKey<String>('material'),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: onTap,
                ),
              ),
            ),
          ],
        ),
      );

  static Widget _errorBuilder(BuildContext context, Object error, StackTrace? stackTrace) =>
      const Center(child: Text('Error'));

  // ignore: unused_element
  static double _progressFromChunk(ImageChunkEvent progress) =>
      ((progress.cumulativeBytesLoaded) / (progress.expectedTotalBytes ?? 1)).clamp(0, 1);

  static Widget _buildImage(GeneratedImage image) => Image.network(
        image.url.toString(),
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) => loadingProgress == null
            ? child
            : Center(
                child: CircularProgressIndicator(
                  value: _progressFromChunk(loadingProgress),
                ),
              ),
        errorBuilder: _errorBuilder,
      );
}
