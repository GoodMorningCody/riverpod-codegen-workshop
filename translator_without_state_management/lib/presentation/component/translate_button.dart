import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:translator_without_state_management/common/color_util.dart';

class TranslateButton extends StatelessWidget {
  final VoidCallback? onTranslate;
  const TranslateButton({super.key, required this.onTranslate});

  @override
  Widget build(BuildContext context) {
    final canTranslate = onTranslate != null;
    return GestureDetector(
      onTap: onTranslate,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LineIcon.language(
              size: 16,
              color: canTranslate ? ColorUtil.grayScale48 : ColorUtil.grayScale164,
            ),
            const SizedBox(width: 4),
            Text(
              '번역하기',
              style: TextStyle(
                fontSize: 12,
                color: canTranslate ? ColorUtil.grayScale12 : ColorUtil.grayScale164,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
