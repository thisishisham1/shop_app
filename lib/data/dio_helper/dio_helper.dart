import 'package:dio/dio.dart';

import '../../component/constant.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: baseUrl, receiveDataWhenStatusError: true));
  }
}
