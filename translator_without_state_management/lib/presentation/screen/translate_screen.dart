import 'package:flutter/material.dart';
import 'package:translator_without_state_management/common/enum.dart';
import 'package:translator_without_state_management/domain/translator.dart';
import 'package:translator_without_state_management/presentation/layout/translate_body.dart';
import 'package:translator_without_state_management/presentation/layout/translate_bottom.dart';
import 'package:translator_without_state_management/presentation/layout/translate_top.dart';

class TranslateScreen extends StatefulWidget {
  final Translator translator;
  const TranslateScreen({super.key, required this.translator});

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  String? sourceText;
  final List<Languages?> languages = [Languages.korean, Languages.english];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TranslateTop(
              onExchangeLanguage: () {
                setState(() {
                  final source = languages[LanguageKind.source.index];
                  languages[LanguageKind.source.index] =
                      languages[LanguageKind.dest.index];
                  languages[LanguageKind.dest.index] = source;
                });
              },
              onChangedLanguage: (language, kind) {
                setState(() {
                  languages[kind.index] = language;
                  final otherKind = kind == LanguageKind.source
                      ? LanguageKind.dest
                      : LanguageKind.source;
                  if (languages[kind.index] == languages[otherKind.index]) {
                    languages[otherKind.index] = null;
                  }
                });
              },
            ),
            TranslateBody(
              onChangedText: (text) {
                setState(() => sourceText = text);
              },
            ),
            TranslateBottom(
              onTranslate: (sourceText?.isEmpty ?? true) ||
                      languages.contains(null)
                  ? null
                  : () {
                      widget.translator
                          .translate(source: sourceText!, languages: languages)
                          .then(
                        (value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('번역 결과: $value'),
                            ),
                          );
                        },
                      );
                    },
            ),
          ],
        ),
      ),
    );
  }
}
