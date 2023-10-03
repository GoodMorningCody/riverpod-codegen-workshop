
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translator_without_state_management/domain/provider/languages_notifier_provider.dart';
import 'package:translator_without_state_management/domain/provider/translate_text_notifier_provider.dart';

final translateActivateProvider = Provider((ref) {
  final translateText = ref.watch(translateTextNotifierProvider);
  final selectedLanguages = ref.watch(languagesNotifierProvider);

  if( translateText.isEmpty ) {
    return false;
  }

  return selectedLanguages.$1 != null && selectedLanguages.$2 != null;
});