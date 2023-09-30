import 'package:flutter/material.dart';
import 'package:translator_without_state_management/presentation/component/translate_input_textfield.dart';

class TranslateBody extends StatelessWidget {
  final TextCallback onChangedText;
  const TranslateBody({super.key, required this.onChangedText});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: TranslateInputTextField(onChnagedText: onChangedText),
              ),
            ),
          );
        },
      ),
    );
  }
}
