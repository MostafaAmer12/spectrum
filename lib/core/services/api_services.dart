import 'package:dio/dio.dart';
import 'package:educational_kids_game/core/consts/const_text.dart';

class ApiService {
  final Dio dio;

  ApiService({
    required this.dio,
  });

  Future<Map<String, dynamic>> getWithToken({
    required String endPoint,
    required String token,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Authorization": 'Bearer $token',
    };
    dio.interceptors.add(CustomLogInterceptor());
    var response = await dio.get(
      '${ConstText().baseUrl}$endPoint',
      queryParameters: query,
      options: Options(
        validateStatus: (status) {
          return status! == 200 ||
              status == 201 ||
              status == 202 ||
              status == 400;
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> getWithoutToken(
      {required String endPoint}) async {
    dio.interceptors.add(CustomLogInterceptor());

    var response = await dio.get(
      '${ConstText().baseUrl}$endPoint',
      options: Options(
        validateStatus: (status) {
          return status! == 200 ||
              status == 201 ||
              status == 202 ||
              status == 401;
        },
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> postWithToken({
    required String endPoint,
    required dynamic body,
    required String token,
  }) async {
    dio.options.headers = {
      "Authorization": 'Bearer $token',
    };
    dio.interceptors.add(CustomLogInterceptor());

    var response = await dio.post(
      '${ConstText().baseUrl}$endPoint',
      data: body,
      options: Options(
        validateStatus: (status) {
          return status! == 200 ||
              status == 201 ||
              status == 202 ||
              status == 400;
        },
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> postWithTokenUR({
    required String endPoint,
    required dynamic body,
    required String token,
  }) async {
    dio.options.headers = {
      "Authorization": 'Bearer $token',
      // 'contentType': 'application/x-www-form-urlencoded',
    };
    dio.interceptors.add(CustomLogInterceptor());
    dio.options.contentType = Headers.formUrlEncodedContentType;
    var response = await dio.post(
      '${ConstText().baseUrl}$endPoint',
      data: body,
      options: Options(
        validateStatus: (status) {
          return status! == 200 ||
              status == 201 ||
              status == 202 ||
              status == 400;
        },
      ),
    );

    return response.data;
  }

  Future<dynamic> postWithoutToken({
    required String endPoint,
    required dynamic body,
  }) async {
    dio.interceptors.add(CustomLogInterceptor());

    var response =
        await dio.post('${ConstText().baseUrl}$endPoint', data: body);
    return response.data;
  }

  Future<Response> put({
    Map<String, dynamic>? headers,
    required endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Authorization": "Bearer ",
    };
    dio.interceptors.add(CustomLogInterceptor());

    var response = await dio.put(
      '${ConstText().baseUrl}$endPoint',
      queryParameters: query,
      options: Options(
        validateStatus: (status) {
          return status! == 200 ||
              status == 201 ||
              status == 202 ||
              status == 400;
        },
      ),
      data: data,
    );
    return response;
  }

  Future<Map<String, dynamic>> patch({
    Map<String, dynamic>? headers,
    required endPoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Authorization": "Bearer ",
    };
    dio.interceptors.add(CustomLogInterceptor());

    var response = await dio.patch(
      '${ConstText().baseUrl}$endPoint',
      queryParameters: query,
      options: Options(
        validateStatus: (status) {
          return status! == 200 ||
              status == 201 ||
              status == 202 ||
              status == 400;
        },
      ),
      data: data,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> patchWithToken({
    Map<String, dynamic>? headers,
    required endPoint,
    required token,
    required dynamic body,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      "Authorization": "Bearer $token",
    };
    dio.interceptors.add(CustomLogInterceptor());

    var response = await dio.patch(
      '${ConstText().baseUrl}$endPoint',
      queryParameters: query,
      options: Options(
        validateStatus: (status) {
          return status! == 200 ||
              status == 201 ||
              status == 202 ||
              status == 400;
        },
      ),
      data: body,
    );
    return response.data;
  }

  Future<Response> delete(
      {Map<String, dynamic>? headers,
      required endPoint,
      Map<String, dynamic>? query}) async {
    dio.options.headers = {
      "Authorization": "Bearer ",
    };
    dio.interceptors.add(CustomLogInterceptor());

    var response = await dio.delete(
      '${ConstText().baseUrl}$endPoint',
      queryParameters: query,
      options: Options(
        validateStatus: (status) {
          return status! == 200 ||
              status == 201 ||
              status == 202 ||
              status == 400;
        },
      ),
    );
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
