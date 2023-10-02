import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translator_without_state_management/common/enum.dart';

typedef SourceAndDestLanguage = (Languages? source, Languages? dest);

class LanguagesNotifier extends Notifier<SourceAndDestLanguage> {
  @override
  SourceAndDestLanguage build() {
    return (Languages.korean, Languages.english);
  }

  void exchange() {
    state = (state.$2, state.$1);
  }

  void setLanguage(LanguageKind kind, Languages? language) {
    if (kind == LanguageKind.source) {
      state = (language, state.$2 == language ? null : state.$2);
    } else {
      state = (state.$1 == language ? null : state.$1, language);
    }
  }
}
