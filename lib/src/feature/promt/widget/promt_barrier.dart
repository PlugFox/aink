import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// {@template promt_barrier}
/// PromtBarrier
/// {@endtemplate}
class PromtBarrier extends StatefulWidget {
  /// {@macro promt_barrier}
  const PromtBarrier({
    required this.enabled,
    required this.onDismiss,
    this.duration = const Duration(milliseconds: 450),
  });

  /// The duration of the animation.
  final Duration duration;

  /// Is barrier is enabled?
  final ValueListenable<bool> enabled;

  final VoidCallback onDismiss;

  @override
  State<PromtBarrier> createState() => _PromtBarrierState();
}

class _PromtBarrierState extends State<PromtBarrier> with SingleTickerProviderStateMixin {
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
  void didUpdateWidget(PromtBarrier oldWidget) {
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
  Widget build(BuildContext context) => ValueListenableBuilder<bool>(
        valueListenable: _hide,
        builder: (context, value, child) => Offstage(
          offstage: value,
          child: IgnorePointer(ignoring: value, child: child),
        ),
        child: AnimatedModalBarrier(
          dismissible: true,
          color: ColorTween(
            begin: Colors.transparent,
            end: Colors.black26,
          ).animate(_controller),
          onDismiss: widget.onDismiss,
        ),
      );
}
