import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/initialization/dependencies.dart';
import '../../../common/util/error_util.dart';
import '../../../common/util/screen_util.dart';
import '../../photo_view/widget/photo_view_screen.dart';
import '../../wheel/widget/colored_card.dart';
import '../bloc/promt_bloc.dart';
import 'promt_image_card.dart';
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
                    child: ValueListenableBuilder(
                      valueListenable: barrierEnabled,
                      builder: (context, enabled, child) => AnimatedOpacity(
                        duration: const Duration(milliseconds: 450),
                        opacity: enabled ? 1 : 0,
                        child: ModalBarrier(
                          dismissible: enabled,
                          color: Colors.black26,
                          onDismiss: () {
                            _focusNode.unfocus();
                            disableBarrier();
                          },
                        ),
                      ),
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

  Widget _buildImage(PromtState state, int index) {
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
              _focusNode.unfocus();
              HapticFeedback.lightImpact().ignore();
            }
          : () {
              _focusNode.unfocus();
              HapticFeedback.lightImpact().ignore();
              Dependencies.instance.promtBLoC.add(PromtEvent.focus(index: index));
            },
    );
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

class _PromtBarrier extends StatefulWidget {
  /// {@macro promt_barrier}
  const _PromtBarrier({
    required this.enabled,
    required this.child,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /// The duration of the animation.
  final Duration duration;

  /// Is barrier is enabled?
  final bool enabled;

  @override
  State<_PromtBarrier> createState() => __PromtBarrierState();
}

class __PromtBarrierState extends State<_PromtBarrier> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      value: 0,
    );
  }

  @override
  void didUpdateWidget(_PromtBarrier oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.duration != _controller.duration) {
      _controller.duration = widget.duration;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // The configuration of InheritedWidgets has changed
    // Also called after initState but before build
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  /* #endregion */

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
  Widget build(BuildContext context) => widget.child;
}
