import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translator_without_state_management/data/translate_repository.dart';

final translateRepositoryProvider = Provider((ref) {
  return TranslateRepository();
});