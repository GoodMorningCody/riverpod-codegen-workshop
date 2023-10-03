import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icon.dart';
import 'package:translator_without_state_management/common/color_util.dart';
import 'package:translator_without_state_management/domain/provider/translate_activate_provider.dart';
import 'package:translator_without_state_management/domain/provider/translate_provider.dart';

class TranslateButton extends ConsumerWidget {
  const TranslateButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canTranslate = ref.watch(translateActivateProvider);
    return GestureDetector(
      onTap: () {
        ref.read(translateProvider).then((value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('번역 결과: $value')));
        });
      },
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LineIcon.language(
              size: 16,
              color:
                  canTranslate ? ColorUtil.grayScale48 : ColorUtil.grayScale164,
            ),
            const SizedBox(width: 4),
            Text(
              '번역하기',
              style: TextStyle(
                fontSize: 12,
                color: canTranslate
                    ? ColorUtil.grayScale12
                    : ColorUtil.grayScale164,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
