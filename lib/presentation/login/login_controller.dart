import 'package:get/get.dart';
import 'package:technical_assessment_vascomm/data/utils/my_pref.dart';
import 'package:technical_assessment_vascomm/domain/usecases/login_use_case.dart';
import 'package:technical_assessment_vascomm/presentation/get_bindings.dart';
import 'package:technical_assessment_vascomm/presentation/home/home_page.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;

  LoginController({required this.loginUseCase});

  RxBool isLoading = false.obs;

  final accessToken = Get.find<MyPref>().accessToken;

  Future login(String email, String password) async {
    isLoading.value = true;
    update();
    final login = await loginUseCase.execute(email, password);
    isLoading.value = false;
    if (login['statusCode'] == 200) {
      accessToken.val = login['token'];
      Get.offAll(() => HomePage(), binding: GetBindings());
    } else {
      Get.showSnackbar(
        GetSnackBar(
          title: 'Login failed',
          message: login['message'],
          duration: const Duration(seconds: 2),
        ),
      );
    }
    update();
  }
}
