import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:translator_without_state_management/common/color_util.dart';

class LanguageExchanger extends StatelessWidget {
  final VoidCallback onExchangeLanguage;
  const LanguageExchanger({super.key, required this.onExchangeLanguage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onExchangeLanguage,
      child: Container(
        width: 62,
        height: 28,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: ColorUtil.grayScale74,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        child: const LineIcon.alternateExchange(
          color: Colors.white,
          size: 14,
        ),
      ),
    );
  }
}
