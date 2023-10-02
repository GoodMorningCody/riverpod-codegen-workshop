import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:translator_without_state_management/domain/notifier/languages_notifier.dart';

final languagesNotifierProvider = NotifierProvider(() {
  return LanguagesNotifier();
});
