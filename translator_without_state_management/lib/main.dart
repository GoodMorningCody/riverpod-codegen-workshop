import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translator_without_state_management/common/color_util.dart';
import 'package:translator_without_state_management/data/translate_repository.dart';
import 'package:translator_without_state_management/domain/translator.dart';
import 'package:translator_without_state_management/presentation/screen/translate_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: ColorUtil.background,
      ),
      debugShowCheckedModeBanner: false,
      home: TranslateScreen(
        translator: Translator(
          repository: TranslateRepository(),
        ),
      ),
    );
  }
}
