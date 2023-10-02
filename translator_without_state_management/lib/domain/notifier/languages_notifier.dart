import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translator_without_state_management/common/enum.dart';

typedef SourceAndDestLanguage = (Languages? source, Languages? dest);
class LanguagesNotifier extends Notifier<SourceAndDestLanguage> {
  @override
  SourceAndDestLanguage build() {
    return (Languages.korean, Languages.english);
  }

  Languages? getLanguage(LanguageKind kind) {
    return kind == LanguageKind.source ? state.$1 : state.$2;
  }
}