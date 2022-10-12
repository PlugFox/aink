import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/initialization/dependencies.dart';
import '../bloc/promt_bloc.dart';

/// {@template promt_suggestions}
/// PromtSuggestions widget
/// {@endtemplate}
class PromtSuggestions extends StatefulWidget {
  /// {@macro promt_suggestions}
  const PromtSuggestions({
    required this.enabled,
    required this.onSuggestion,
    required this.onDismiss,
    required this.inputController,
    this.duration = const Duration(milliseconds: 450),
    super.key,
  });

  /// Is barrier is enabled?
  final ValueListenable<bool> enabled;

  final TextEditingController inputController;

  final void Function(String promt) onSuggestion;

  final void Function() onDismiss;

  /// The duration of the animation.
  final Duration duration;

  @override
  State<PromtSuggestions> createState() => _PromtSuggestionsState();
}

class _PromtSuggestionsState extends State<PromtSuggestions> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final ValueNotifier<bool> _hide = ValueNotifier<bool>(true);

  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      value: 0,
    )..addStatusListener((status) => _hide.value = status == AnimationStatus.dismissed);
    widget.enabled.addListener(_onEnabledChanged);
  }

  @override
  void didUpdateWidget(PromtSuggestions oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.duration != _controller.duration) {
      _controller.duration = widget.duration;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    widget.enabled.removeListener(_onEnabledChanged);
    super.dispose();
  }
  /* #endregion */

  void _onEnabledChanged() => widget.enabled.value ? _controller.forward() : _controller.reverse();

  @visibleForTesting
  Future<void> forward() async {
    if (_controller.isCompleted) return;
    try {
      await _controller.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @visibleForTesting
  Future<void> reverse() async {
    if (_controller.isDismissed) return;
    try {
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @visibleForTesting
  Future<void> repeat() async {
    try {
      await _controller.repeat().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) => RepaintBoundary(
        child: GestureDetector(
          onTap: widget.onDismiss,
          child: ValueListenableBuilder<bool>(
            valueListenable: _hide,
            builder: (context, value, child) => Offstage(
              offstage: value,
              child: IgnorePointer(ignoring: value, child: child),
            ),
            child: FadeTransition(
              opacity: _controller,
              child: LayoutBuilder(
                builder: (context, constraints) => IgnorePointer(
                  ignoring: false,
                  child: Material(
                    color: Colors.transparent,
                    child: BlocBuilder<PromtBLoC, PromtState>(
                      bloc: Dependencies.instance.promtBLoC,
                      builder: (context, state) => Align(
                        alignment: Alignment.topCenter,
                        child: ScrollConfiguration(
                          behavior: _RemoveGlow(),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            padding: const EdgeInsets.all(8),
                            itemCount: state.suggestions.length,
                            itemExtent: 64,
                            itemBuilder: (context, index) {
                              /* if (index == 0) {
                                  return const _SuggestionIcons();
                                } */
                              if (index >= state.suggestions.length) {
                                return const SizedBox.shrink();
                              }
                              final suggestion = state.suggestions[index];
                              return ValueListenableBuilder<TextEditingValue>(
                                valueListenable: widget.inputController,
                                builder: (context, value, child) => _SuggestionTile(
                                  key: ValueKey<String>('promt-suggestion-$index'),
                                  title: suggestion,
                                  onTap: value.text == suggestion ? null : () => widget.onSuggestion(suggestion),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

/* class _SuggestionIcons extends StatelessWidget {
  const _SuggestionIcons();

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            Expanded(child: Placeholder()),
            SizedBox(width: 8),
            Expanded(child: Placeholder()),
            SizedBox(width: 8),
            Expanded(child: Placeholder()),
          ],
        ),
      );
} */

class _SuggestionTile extends StatelessWidget {
  const _SuggestionTile({required this.title, required this.onTap, Key? key}) : super(key: key);

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: onTap == null ? 0.25 : 1,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            enabled: onTap != null,
            tileColor: Colors.black54,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            onTap: onTap,
            title: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      );
}

class _RemoveGlow extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) => child;
}
