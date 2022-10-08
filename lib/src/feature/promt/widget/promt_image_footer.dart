import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/initialization/dependencies.dart';
import '../../../common/util/downloader.dart';
import '../../../common/util/error_util.dart';

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
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {
              final url = Dependencies.instance.promtBLoC.state.data.images?.firstOrNull?.url;
              if (url == null) return;
              // ignore: argument_type_not_assignable_to_error_handler
              Downloader.downloadUrl(url).then<void>((_) => HapticFeedback.mediumImpact(), onError: ErrorUtil.logError);
            },
            icon: const Icon(Icons.download),
          ),
        ],
      );
}
