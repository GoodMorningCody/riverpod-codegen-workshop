import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:translator_without_state_management/common/papago.dart';
import 'package:translator_without_state_management/data/papago_response.dart';
import 'package:translator_without_state_management/domain/provider/languages_notifier_provider.dart';

class TranslateRepository {
  final dio = Dio();
  TranslateRepository() {
    dio.interceptors.add(
      PrettyDioLogger(
        error: true,
        request: true,
        responseBody: true,
        maxWidth: 200,
      ),
    );
  }

  Future<PapagoResponse> translate({
    required String source,
    required SourceAndDestLanguages languages,
  }) async {
    final response = await dio.request(
      "https://openapi.naver.com/v1/papago/n2mt?source=${languages.$1}&target=${languages.$2}&text=$source",
      options: Options(
        method: 'POST',
        contentType: 'application/x-www-form-urlencoded',
        headers: {
          'X-Naver-Client-Id': papagoClientId,
          'X-Naver-Client-Secret': papagoClientSecret,
        },
      ),
    );
    return PapagoResponse.fromJson(response.data!);
  }
}
