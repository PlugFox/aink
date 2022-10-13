import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;

import '../../../common/initialization/dependencies.dart';
import '../../../common/util/analytics.dart';
import '../../../common/util/downloader.dart';
import '../../../common/util/error_util.dart';
import 'promt_image_card.dart';

/// {@template promt_image_footer}
/// PromtImageFooter widget
/// {@endtemplate}
class PromtImageFooter extends StatelessWidget {
  /// {@macro promt_image_footer}
  const PromtImageFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const Widget? leading = null;
    const Widget center = _PromtImageFooterButtons();
    const Widget? trailing = null;

    final darkTheme = ThemeData.dark();
    return RepaintBoundary(
      child: SizedBox(
        //height: (center != null) ? 68.0 : 48.0,
        height: 68,
        child: Material(
          elevation: 0,
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
              start: leading != null ? 8.0 : 16.0,
              end: trailing != null ? 8.0 : 16.0,
            ),
            child: Theme(
              data: darkTheme,
              child: IconTheme.merge(
                data: const IconThemeData(color: Colors.white),
                child: Row(
                  children: <Widget>[
                    if (leading != null) const Padding(padding: EdgeInsetsDirectional.only(end: 8), child: leading),
                    //if (center != null)
                    Expanded(
                      child: DefaultTextStyle(
                        style: darkTheme.textTheme.titleMedium!,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        child: center,
                      ),
                    ),
                    if (trailing != null) const Padding(padding: EdgeInsetsDirectional.only(start: 8), child: trailing),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PromtImageFooterButtons extends StatelessWidget {
  const _PromtImageFooterButtons();

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          const iconCount = 4;
          final width = constraints.biggest.width;
          final size = Size.square(
            math.min<double>(
              math.min<double>(kMinInteractiveDimension, width / iconCount),
              constraints.biggest.height,
            ),
          );
          final padding = ((width - size.width * iconCount) / ((iconCount - 1) * 2)).clamp(.0, 8.0);
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: null,
                constraints: BoxConstraints.loose(size),
                padding: EdgeInsets.all(padding),
                icon: const Icon(Icons.favorite),
                tooltip: 'Favorite',
              ),
              if (width > 159)
                IconButton(
                  onPressed: null,
                  constraints: BoxConstraints.loose(size),
                  padding: EdgeInsets.all(padding),
                  icon: const Icon(Icons.info),
                  tooltip: 'Info',
                ),
              IconButton(
                onPressed: null,
                constraints: BoxConstraints.loose(size),
                padding: EdgeInsets.all(padding),
                icon: const Icon(Icons.share),
                tooltip: 'Share',
              ),
              IconButton(
                onPressed: () => _saveImage(context),
                constraints: BoxConstraints.loose(size),
                padding: EdgeInsets.all(padding),
                icon: const Icon(Icons.download),
                tooltip: 'Download',
              ),
            ],
          );
        },
      );

  void _saveImage(BuildContext context) {
    final url = context.findAncestorWidgetOfExactType<PromtImageCard>()?.image?.url;
    final promt = Dependencies.instance.promtBLoC.state.data.promt;
    if (url == null) return;
    var name = promt?.replaceAll(RegExp('[^a-zA-Z0-9_-]'), '_') ?? 'image';
    while (name.contains('__')) {
      name = name.replaceAll('__', '_');
    }
    if (name.startsWith('_')) name = name.substring(1);
    if (name.length < 3) {
      name = 'image';
    } else if (name.length > 10) {
      name = name.substring(0, 10);
    }
    if (name.endsWith('_')) name = name.substring(0, name.length - 1);
    final timestamp = DateTime.now().difference(DateTime(2022)).inSeconds.toRadixString(36);
    final ext = p.extension(url.pathSegments.lastOrNull ?? 'image.jpg');
    final filename = '$name-$timestamp$ext';
    Downloader.downloadUrl(url, filename: filename).then<void>(
      (_) {
        HapticFeedback.mediumImpact().ignore();
        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
          SnackBar(
            content: Text('Image "$filename" successfully saved'),
            duration: const Duration(seconds: 5),
          ),
        );
        Analytics.logGenerateImagesDownloaded();
      },
      onError: (Object error, StackTrace stackTrace) {
        ErrorUtil.logError(error, stackTrace).ignore();
        HapticFeedback.lightImpact().ignore();
        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
          SnackBar(
            content: Text('Image "$filename" failed to save'),
            duration: const Duration(seconds: 5),
            backgroundColor: Colors.red,
          ),
        );
      },
    );
  }
}
