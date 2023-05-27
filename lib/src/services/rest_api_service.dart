import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rest_api_service.g.dart';

@riverpod
class RestApiService extends _$RestApiService {
  late final String url;
  late final String path;

  @override
  RestApiService build({
    required String url,
    required String path,
  }) {
    return RestApiService()
      ..url = url
      ..path = path;
  }

  Future<RestApiResponse> get({
    String endpoint = '',
    Map<String, String>? params,
  }) async {
    final response = await http.get(
      Uri.https(
        url,
        path + endpoint,
        params,
      ),
    );

    return RestApiResponse(
      statusCode: response.statusCode,
      body: response.body,
    );
  }
}

class RestApiResponse {
  final int statusCode;
  final String body;

  RestApiResponse({
    required this.statusCode,
    required this.body,
  });
}
