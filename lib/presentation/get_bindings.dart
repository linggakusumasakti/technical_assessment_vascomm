import 'package:get/get.dart';
import 'package:technical_assessment_vascomm/data/utils/rest_api_controller.dart';
import 'package:technical_assessment_vascomm/injection.dart' as di;
import 'package:technical_assessment_vascomm/presentation/home/home_controller.dart';
import 'package:technical_assessment_vascomm/presentation/login/login_controller.dart';

import '../data/utils/my_pref.dart';

class GetBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyPref());
    Get.lazyPut(() => RestApiController());
    Get.lazyPut(() => di.locator<LoginController>());
    Get.lazyPut(() => di.locator<HomeController>());
  }
}
