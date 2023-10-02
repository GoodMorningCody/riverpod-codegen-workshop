import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translator_without_state_management/domain/provider/languages_notifier_provider.dart';
import 'package:translator_without_state_management/domain/translator.dart';
import 'package:translator_without_state_management/presentation/layout/translate_body.dart';
import 'package:translator_without_state_management/presentation/layout/translate_bottom.dart';
import 'package:translator_without_state_management/presentation/layout/translate_top.dart';

class TranslateScreen extends ConsumerStatefulWidget {
  final Translator translator;
  const TranslateScreen({super.key, required this.translator});

  @override
  ConsumerState<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends ConsumerState<TranslateScreen> {
  String? sourceText;
  // final List<Languages?> languages = [Languages.korean, Languages.english];
  @override
  Widget build(BuildContext context) {
    final languages = ref.watch(languagesNotifierProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TranslateTop(
                // onExchangeLanguage: () {
                //   setState(() {
                //     final source = languages[LanguageKind.source.index];
                //     languages[LanguageKind.source.index] =
                //         languages[LanguageKind.dest.index];
                //     languages[LanguageKind.dest.index] = source;
                //   });
                // },
                // onChangedLanguage: (language, kind) {
                //   setState(() {
                //     languages[kind.index] = language;
                //     final otherKind = kind == LanguageKind.source
                //         ? LanguageKind.dest
                //         : LanguageKind.source;
                //     if (languages[kind.index] == languages[otherKind.index]) {
                //       languages[otherKind.index] = null;
                //     }
                //   });
                // },
                ),
            TranslateBody(
              onChangedText: (text) {
                setState(() => sourceText = text);
              },
            ),
            TranslateBottom(
              onTranslate: (sourceText?.isEmpty ?? true) ||
                      languages.$1 == null ||
                      languages.$2 == null
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
