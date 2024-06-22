import 'package:dio/dio.dart';
import 'package:educational_kids_game/core/consts/const_text.dart';

class ApiService {
  final Dio dio;

  ApiService({
    required this.dio,
  });

  Future<dynamic> postWithoutToken({
    required String endPoint,
    required dynamic body,
  }) async {
    dio.interceptors.add(CustomLogInterceptor());

    var response =
        await dio.post('${ConstText().baseUrl}$endPoint', data: body);
    return response.data;
  }
}

class CustomLogInterceptor extends LogInterceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Log request URL and headers
    print('--> ${options.method} ${options.uri}');
    options.headers.forEach((key, value) {
      print('$key: $value');
    });

    // Log request body if it's present
    if (options.data != null) {
      print('Request body: ${options.data}');
    }

    super.onRequest(options, handler);
  }
}
