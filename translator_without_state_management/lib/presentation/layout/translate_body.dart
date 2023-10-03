import 'package:flutter/material.dart';
import 'package:translator_without_state_management/presentation/component/translate_input_textfield.dart';

class TranslateBody extends StatelessWidget {
  const TranslateBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: TranslateInputTextField(),
      ),
    );
  }
}
