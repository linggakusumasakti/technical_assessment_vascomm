import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:technical_assessment_vascomm/data/utils/rest_api_controller.dart';

import '../utils/endpoint.dart';

abstract class RemoteDataSource {
  Future<Map<String, dynamic>> login(String email, String password);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final restApiController = Get.find<RestApiController>();

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      var parameter = {"email": email, "password": password};
      var response = await restApiController.post(
          endpoint: Endpoint.login, data: parameter);
      if (response?.statusCode == 200) {
        restApiController.updateAccessToken(response?.data['token']);
        return {
          'statusCode': response?.statusCode,
          'token': response?.data['token']
        };
      }

      return {
        'statusCode': response?.statusCode,
        'message': response?.data['error']
      };
    } on DioException catch (e) {
      log('error login $e');
      return {'statusCode': 500, 'message': e.message};
    }
  }
}
