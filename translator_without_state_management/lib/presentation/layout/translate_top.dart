import 'package:flutter/material.dart';
import 'package:translator_without_state_management/common/color_util.dart';
import 'package:translator_without_state_management/common/enum.dart';
import 'package:translator_without_state_management/presentation/component/language_exchanger.dart';
import 'package:translator_without_state_management/presentation/component/language_selector.dart';

class TranslateTop extends StatelessWidget {
  final Function(Languages language, LanguageKind kind) onChangedLanguage;
  final VoidCallback onExchangeLanguage;
  const TranslateTop({super.key, required this.onChangedLanguage, required this.onExchangeLanguage});

  Widget _createLanguageSelector(LanguageKind kind) {
    return Expanded(
      flex: 1,
      child: LanguageSelector(
        languageKind: kind,
        onSelectedLanguage: (language) => onChangedLanguage(language, kind),
      ),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 48,
          child: Row(
            children: [
              _createLanguageSelector(LanguageKind.source),
              LanguageExchanger(onExchangeLanguage: onExchangeLanguage),
              _createLanguageSelector(LanguageKind.dest),
            ],
          ),
        ),
        Container(
          height: 0.5,
          color: ColorUtil.grayScale74,
        ),
      ],
    );
  }
}
