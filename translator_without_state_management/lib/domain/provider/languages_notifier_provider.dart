import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translator_without_state_management/common/enum.dart';

typedef SourceAndDestLanguages = (Languages? source, Languages? dest);

class LanguagesNotifier extends Notifier<SourceAndDestLanguages> {
  @override
  SourceAndDestLanguages build() {
    return (Languages.korean, Languages.english);
  }

  void changeLanguage(LanguageKind kind, Languages language) {
    if( kind == LanguageKind.source ) {
      state = (language, language == state.$2 ? null : state.$2);
    } else {
      state = (language == state.$1 ? null : state.$1, language);
    }
  }

  void exchange() {
    state = (state.$2, state.$1);
  }
}

final languagesNotifierProvider =
    NotifierProvider<LanguagesNotifier, SourceAndDestLanguages>(() {
  return LanguagesNotifier();
});
