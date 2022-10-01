import 'package:collection/collection.dart';
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
import 'promt_layout.dart';
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

class _PromtScreenState extends State<PromtScreen> with SingleTickerProviderStateMixin {
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
  Widget build(BuildContext context) => OrientationBuilder(
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
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: orientation == Orientation.landscape ? 8 : 48,
                ),
                child: Center(
                  child: SizedBox(
                    width: 1024,
                    child: Center(
                      child: BlocBuilder<PromtBLoC, PromtState>(
                        bloc: Dependencies.instance.promtBLoC,
                        builder: (context, state) => PromtLayout.expanded(
                          promtInput: SizedBox.square(
                            child: ColoredCard.expanded(
                              color: Colors.red,
                              animation: _animationController,
                              child: PromtTextInput(
                                focusNode: _focusNode,
                                controller: _inputController,
                                onSubmit: _onSubmit,
                              ),
                            ),
                          ),
                          promtSend: ColoredCard.expanded(
                            color: Colors.green,
                            animation: _animationController,
                            child: PromtSendButton(
                              controller: _inputController,
                              onSubmit: _onSubmit,
                            ),
                          ),
                          imageCard: ColoredCard.compact(
                            color: Colors.blue,
                            child: _buildImage(state, 0),
                          ),
                          previewCards: <Widget>[
                            ColoredCard.expanded(
                              animation: _animationController,
                              color: Colors.orange,
                              child: _buildImage(state, 1),
                            ),
                            ColoredCard.compact(
                              color: Colors.pink,
                              child: _buildImage(state, 2),
                            ),
                            ColoredCard.expanded(
                              animation: _animationController,
                              color: Colors.purple,
                              child: _buildImage(state, 3),
                            ),
                          ],
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

  void _onSubmit() {
    if (Dependencies.instance.promtBLoC.state.isProcessing) return;
    _focusNode.unfocus();
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
            },
    );
  }
}
