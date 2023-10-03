
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TranslateTextNotifier extends Notifier<String> {
  @override
  String build() {
    return '';
  }

  void onChanged(String text) {
    state = text;
  }
}

final translateTextNotifierProvider = NotifierProvider<TranslateTextNotifier, String>(() {
  return TranslateTextNotifier();
});