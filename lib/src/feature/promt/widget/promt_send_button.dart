import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/initialization/dependencies.dart';
import '../bloc/promt_bloc.dart';

/// {@template promt_send_button}
/// PromtSendButton widget
/// {@endtemplate}
class PromtSendButton extends StatelessWidget {
  /// {@macro promt_send_button}
  const PromtSendButton({
    required TextEditingController controller,
    required FocusNode focusNode,
    // ignore: unused_element
    super.key,
  })  : _inputController = controller,
        _focusNode = focusNode;

  final TextEditingController _inputController;
  final FocusNode _focusNode;

  @override
  Widget build(BuildContext context) => SizedBox.square(
        dimension: 48,
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: BlocBuilder<PromtBLoC, PromtState>(
            bloc: Dependencies.instance.promtBLoC,
            builder: (context, state) => ValueListenableBuilder<TextEditingValue>(
              valueListenable: _inputController,
              builder: (context, value, child) => InkWell(
                key: const ValueKey<String>('promt_send'),
                borderRadius: BorderRadius.circular(16),
                onTap: value.text.length < 3 || state.isProcessing ? null : _send,
                child: Align(
                  alignment: const Alignment(0.1, 0),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: value.text.length < 3 || state.isProcessing ? 0.3 : 1,
                    child: const Icon(
                      Icons.send,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  void _send() {
    _focusNode.unfocus();
    Dependencies.instance.promtBLoC.add(PromtEvent.generate(promt: _inputController.text));
  }
}
