import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'interceptor.dart';
import 'my_pref.dart';

class RestApiController extends GetxController {
  static const String baseUrl = 'https://reqres.in/api';

  Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    receiveDataWhenStatusError: true,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  RxString accessToken = Get.find<MyPref>().accessToken.val.obs;

  @override
  void onInit() {
    dio.interceptors.add(ApiInterceptors());
    super.onInit();
  }

  void updateAccessToken(String value) {
    accessToken.value = value;
    update();
  }

  Future post({
    required String endpoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    String? contentType = "application/json",
  }) async {
    try {
      var response = await dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Content-type": contentType,
          },
          followRedirects: false,
          validateStatus: (status) {
            return (status ?? 0) < 500;
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      log(e.message.toString());
    }
  }
}
