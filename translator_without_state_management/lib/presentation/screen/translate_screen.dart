import 'package:flutter/material.dart';
import 'package:translator_without_state_management/presentation/layout/translate_body.dart';
import 'package:translator_without_state_management/presentation/layout/translate_bottom.dart';
import 'package:translator_without_state_management/presentation/layout/translate_top.dart';

class TranslateScreen extends StatelessWidget {
  const TranslateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TranslateTop(),
            TranslateBody(),
            TranslateBottom(),
          ],
        ),
      ),
    );
  }
}
