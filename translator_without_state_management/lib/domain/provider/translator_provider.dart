
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translator_without_state_management/domain/provider/translate_repository_provider.dart';
import 'package:translator_without_state_management/domain/translator.dart';

final translatorProvider = Provider((ref) {
  return Translator(repository: ref.watch(translateRepositoryProvider));
});