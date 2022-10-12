import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/initialization/dependencies.dart';
import '../../../common/util/error_util.dart';
import '../../../common/util/screen_util.dart';
import '../../wheel/widget/colored_card.dart';
import '../bloc/promt_bloc.dart';
import 'promt_image_layout.dart';
import 'promt_send_button.dart';
import 'promt_text_input.dart';

/// {@template promt_screen}
/// PromtScreen widget
/// {@endtemplate}
class PromtScreen extends StatefulWidget {
  /// {@macro promt_screen}
  const PromtScreen({super.key});

  @override
  State<PromtScreen> createState() => _PromtScreenState();
}

class _PromtScreenState extends State<PromtScreen> with SingleTickerProviderStateMixin, _ModalBarrierController {
  late AnimationController _animationController;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      value: 0,
      duration: const Duration(milliseconds: 450),
    );
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) return;
      enableBarrier();
    });
    forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _focusNode.dispose();
    _inputController.dispose();
    super.dispose();
  }

  @visibleForTesting
  Future<void> forward() async {
    if (_animationController.isCompleted) return;
    try {
      await _animationController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @visibleForTesting
  Future<void> reverse() async {
    if (_animationController.isDismissed) return;
    try {
      await _animationController.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) => FocusScope(
        child: OrientationBuilder(
          builder: (context, orientation) => Scaffold(
            resizeToAvoidBottomInset: false,
            floatingActionButtonLocation: orientation == Orientation.landscape
                ? FloatingActionButtonLocation.endFloat
                : FloatingActionButtonLocation.centerFloat,
            floatingActionButton: ScreenUtil.screenSizeOf(context).maybeWhen<FloatingActionButton>(
              extraSmall: () => FloatingActionButton(
                onPressed: () {
                  _focusNode.unfocus();
                  Navigator.pop<void>(context);
                  HapticFeedback.lightImpact().ignore();
                },
                child: const Icon(Icons.menu),
              ),
              orElse: () => FloatingActionButton.large(
                onPressed: () {
                  _focusNode.unfocus();
                  Navigator.pop<void>(context);
                  HapticFeedback.lightImpact().ignore();
                },
                child: const Icon(Icons.menu),
              ),
            ),
            body: BlocListener<PromtBLoC, PromtState>(
              bloc: Dependencies.instance.promtBLoC,
              listener: (context, state) => state.mapOrNull(
                error: (state) => ErrorUtil.showSnackBar(context, state.message),
                processing: (state) => _inputController.text = state.data.promt ?? '',
              ),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    top: 88 + MediaQuery.of(context).padding.top,
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).padding.bottom + (orientation == Orientation.landscape ? 16 : 96),
                    child: Center(
                      child: PromtImageLayout(
                        animation: _animationController,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    key: const ValueKey<String>('PromtScreen#InputBarrier'),
                    child: PromtBarrier(
                      enabled: barrierEnabled,
                      duration: const Duration(milliseconds: 450),
                      onDismiss: () {
                        _focusNode.unfocus();
                        disableBarrier();
                      },
                    ),
                  ),
                  Positioned.fill(
                    child: SafeArea(
                      child: _PromtInputRow(
                        promtHeight: 48,
                        promtWidth: 1024,
                        animationController: _animationController,
                        inputController: _inputController,
                        focusNode: _focusNode,
                        onSubmit: _onSubmit,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  void _onSubmit() {
    if (Dependencies.instance.promtBLoC.state.isProcessing) return;
    _focusNode.unfocus();
    disableBarrier();
    Dependencies.instance.promtBLoC.add(PromtEvent.generate(promt: _inputController.text));
    HapticFeedback.heavyImpact().ignore();
  }
}

mixin _ModalBarrierController on State<PromtScreen> {
  @protected
  ValueListenable<bool> get barrierEnabled => _barrierEnabled;

  final ValueNotifier<bool> _barrierEnabled = ValueNotifier<bool>(false);

  @protected
  void enableBarrier() => _barrierEnabled.value = true;

  @protected
  void disableBarrier() => _barrierEnabled.value = false;
}

class _PromtInputRow extends StatelessWidget {
  const _PromtInputRow({
    required this.promtWidth,
    required this.promtHeight,
    required this.animationController,
    required this.focusNode,
    required this.inputController,
    required this.onSubmit,
  });

  final double promtWidth;
  final double promtHeight;
  final Animation<double> animationController;
  final FocusNode focusNode;
  final TextEditingController inputController;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: promtHeight,
              width: promtWidth,
              child: Hero(
                tag: 'Hero#promtInput',
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: ColoredCard.expanded(
                        color: Colors.red,
                        animation: animationController,
                        child: PromtTextInput(
                          focusNode: focusNode,
                          controller: inputController,
                          onSubmit: onSubmit,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    SizedBox.square(
                      dimension: 48,
                      child: ColoredCard.expanded(
                        color: Colors.green,
                        animation: animationController,
                        child: PromtSendButton(
                          controller: inputController,
                          onSubmit: onSubmit,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

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
          child: child,
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
