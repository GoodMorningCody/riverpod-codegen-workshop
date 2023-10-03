import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icon.dart';
import 'package:translator_without_state_management/common/color_util.dart';
import 'package:translator_without_state_management/common/enum.dart';
import 'package:translator_without_state_management/domain/provider/languages_notifier_provider.dart';
import 'package:translator_without_state_management/presentation/bottom_sheet/language_bottom_sheet.dart';

class LanguageSelector extends ConsumerWidget {
  final LanguageKind languageKind;
  const LanguageSelector({
    super.key,
    required this.languageKind,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languages = ref.watch(languagesNotifierProvider);
    final language = languageKind == LanguageKind.source ? languages.$1 : languages.$2;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<Languages>(
          context: context,
          showDragHandle: true,
          builder: (context) =>
              LanguagesBottomSheet(languageKind: languageKind),
        ).then((value) {
          if (value != null) {
            final languagesNotifier = ref.read(languagesNotifierProvider.notifier);
            languagesNotifier.changeLanguage(languageKind, value);
          }
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (language == null)
            const Text(
              '언어 선택',
              style: TextStyle(color: ColorUtil.grayScale48),
            ),
          if (language != null)
            Text(
              language.display,
              style: const TextStyle(color: Colors.white),
            ),
          const SizedBox(width: 4),
          const LineIcon.angleDown(
            size: 12,
            color: ColorUtil.grayScale164,
          ),
        ],
      ),
    );
  }
}
