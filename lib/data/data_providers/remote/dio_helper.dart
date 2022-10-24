import 'package:dio/dio.dart';

import '../../../constants/end_points.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio!.post(
        url,
        data: data
    );
  }





  static Future<Response> getData(
      {required String url,  Map<String, dynamic>? query}) async {
    return await dio!.get(url, queryParameters: query);
  }


}