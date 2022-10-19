import 'package:dio/dio.dart';
import '../../component/constant.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json'}));
  }

  static Future<Response<dynamic>> postData(
      {Map<String, dynamic>? query,
      required String url,
      required Map<String, dynamic> data,
      String language = 'ar',
      String? Authorization}) async {
    dio.options.headers = {'lang': language, 'Authorization': Authorization};
    Response response = await dio.post(url, queryParameters: query, data: data);
    return response;
  }

  static Future<Response<dynamic>> getData({
    required String url,
    String? Authorization,
    String language = 'en',
  }) async {
    dio.options.headers = {'lang': language, 'Authorization': Authorization,'Content-Type':'application/json'};
    Response response = await dio.get(url);
    return response;
  }
}
