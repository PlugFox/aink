import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/initialization/dependencies.dart';
import '../bloc/promt_bloc.dart';

/// {@template promt_text_input}
/// PromtTextInput widget
/// {@endtemplate}
class PromtTextInput extends StatelessWidget {
  /// {@macro promt_text_input}
  const PromtTextInput({
    required TextEditingController controller,
    required FocusNode focusNode,
    // ignore: unused_element
    super.key,
  })  : _inputController = controller,
        _focusNode = focusNode;

  final TextEditingController _inputController;
  final FocusNode _focusNode;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 1240,
        height: 48,
        child: Material(
          color: Colors.transparent,
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: BlocBuilder<PromtBLoC, PromtState>(
                bloc: Dependencies.instance.promtBLoC,
                builder: (context, state) => SizedBox(
                  height: 48,
                  child: Center(
                    child: TextField(
                      enabled: !state.isProcessing,
                      maxLength: 256,
                      maxLines: 1,
                      minLines: 1,
                      controller: _inputController,
                      focusNode: _focusNode,
                      //cursorWidth: 1,
                      keyboardType: TextInputType.text,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            letterSpacing: -0.5,
                          ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        //labelText: 'Promt',
                        //helperText: 'Helper text',
                        hintStyle: Theme.of(context).textTheme.caption?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              letterSpacing: 0.5,
                            ),
                        hintText: 'Type your promt here',
                        counterText: '',
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
