import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_assessment_vascomm/common/utils/color.dart';
import 'package:technical_assessment_vascomm/common/utils/text_style_proxima.dart';
import 'package:technical_assessment_vascomm/common/widget/copy_right_text.dart';
import 'package:technical_assessment_vascomm/common/widget/custom_text_form_field.dart';
import 'package:technical_assessment_vascomm/common/widget/primary_button.dart';
import 'package:technical_assessment_vascomm/common/widget/welcome_section.dart';
import 'package:technical_assessment_vascomm/presentation/login/login_controller.dart';
import 'package:technical_assessment_vascomm/presentation/register/register_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.find<LoginController>();
  final TextEditingController? emailController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<LoginController>(builder: (context) {
          return SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 50, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const WelcomeSection(),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          labelText: 'Email',
                          hintText: 'Masukkan Email Anda',
                          controller: emailController,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomTextFormField(
                          labelText: 'Password',
                          hintText: 'Masukkan Password Anda',
                          isPassword: true,
                          isObscure: true,
                          isShowForgoPassword: true,
                          controller: passwordController,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        PrimaryButton(
                          text: 'Login',
                          iconData: Icons.arrow_forward,
                          isLoading: controller.isLoading.isTrue,
                          isUseIcon: true,
                          onPressed: () {
                            controller.login(emailController?.text ?? '',
                                passwordController?.text ?? '');
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Belum punya akun ?', style: greyProxima14),
                            InkWell(
                                onTap: () {
                                  Get.to(() => const RegisterPage());
                                },
                                child: Text('  Daftar sekarang',
                                    style: primaryProxima14))
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const CopyRightText(),
                        const SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
