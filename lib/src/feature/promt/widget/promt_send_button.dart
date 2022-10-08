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
    required VoidCallback onSubmit,
    super.key,
  })  : _inputController = controller,
        _onSubmit = onSubmit;

  final TextEditingController _inputController;
  final VoidCallback _onSubmit;

  @override
  Widget build(BuildContext context) => RepaintBoundary(
        child: SizedBox.square(
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
                builder: (context, value, child) {
                  final enabled = value.text.length > 2 && !state.isProcessing;
                  return InkWell(
                    key: const ValueKey<String>('promt_send'),
                    borderRadius: BorderRadius.circular(16),
                    onTap: enabled ? _onSubmit : null,
                    child: Align(
                      alignment: const Alignment(0.1, 0),
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 250),
                        scale: enabled ? 1 : .85,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: enabled ? 1 : .3,
                          child: const Icon(
                            Icons.send,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
}
