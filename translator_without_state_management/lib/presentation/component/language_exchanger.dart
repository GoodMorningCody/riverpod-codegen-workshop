import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icon.dart';
import 'package:translator_without_state_management/common/color_util.dart';
import 'package:translator_without_state_management/domain/provider/languages_notifier_provider.dart';

class LanguageExchanger extends ConsumerWidget {
  const LanguageExchanger({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(languagesNotifierProvider.notifier).exchange();
      },
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
