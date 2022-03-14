import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(baseUrl: ''),
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? qury,
    required Map<String, dynamic> data,
  }) {
    return dio!.post(url, queryParameters: qury, data: data);
  }

  static Future<Response> getData({
    required String key,
  }) async {
    return await dio!.get(key);
  }
}
