import 'package:translator_without_state_management/data/papago_response.dart';
import 'package:translator_without_state_management/data/translate_repository.dart';
import 'package:translator_without_state_management/domain/provider/languages_notifier_provider.dart';

class Translator {
  final TranslateRepository repository;
  const Translator({required this.repository});
  Future<String> translate({required String source, required SourceAndDestLanguages languages}) async {
    PapagoResponse response = await repository.translate(source: source, languages: languages);
    return response.message.result.translatedText;
  }
}