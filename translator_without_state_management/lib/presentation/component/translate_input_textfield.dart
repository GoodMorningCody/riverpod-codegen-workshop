import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icon.dart';
import 'package:translator_without_state_management/common/color_util.dart';
import 'package:translator_without_state_management/domain/provider/translate_text_notifier_provider.dart';

class TranslateInputTextField extends ConsumerStatefulWidget {
  const TranslateInputTextField({super.key});

  @override
  ConsumerState<TranslateInputTextField> createState() =>
      _TranslateInputTextFieldState();
}

class _TranslateInputTextFieldState extends ConsumerState<TranslateInputTextField> {
  late final textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(_onChangedText);
  }

  @override
  void dispose() {
    textEditingController.removeListener(_onChangedText);
    super.dispose();
  }

  void _onChangedText() {
    ref.read(translateTextNotifierProvider.notifier).onChanged(textEditingController.text);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      maxLines: null,
      style: const TextStyle(color: Colors.white),
      cursorColor: ColorUtil.grayScale74,
      decoration: InputDecoration(
        hintText: '번역할 텍스트를 입력해주세요.',
        hintStyle: const TextStyle(
          color: ColorUtil.grayScale74,
          fontWeight: FontWeight.w400,
        ),
        border: InputBorder.none,
        suffix: textEditingController.text.isEmpty
            ? null
            : GestureDetector(
                onTap: () => textEditingController.clear(),
                child: const LineIcon.timesCircle(
                  color: ColorUtil.grayScale164,
                ),
              ),
      ),
    );
  }
}
