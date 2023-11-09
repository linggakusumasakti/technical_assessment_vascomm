import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_assessment_vascomm/common/widget/custom_text_form_field.dart';

import '../../common/utils/text_style_proxima.dart';
import '../../common/widget/copy_right_text.dart';
import '../../common/widget/primary_button.dart';
import '../../common/widget/welcome_section.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WelcomeSection(),
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Expanded(
                            child: CustomTextFormField(
                          labelText: 'Nama Depan',
                          hintText: 'Nama depan',
                          textInputType: TextInputType.name,
                        )),
                        SizedBox(
                          width: 35,
                        ),
                        Expanded(
                            child: CustomTextFormField(
                                labelText: 'Nama Belakang',
                                hintText: 'Nama belakang',
                                textInputType: TextInputType.name)),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const CustomTextFormField(
                      labelText: 'No. KTP',
                      hintText: 'Masukkan No. KTP anda',
                      textInputType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const CustomTextFormField(
                      labelText: 'No. Telpon',
                      hintText: 'Masukkan No Telpon anda',
                      textInputType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const CustomTextFormField(
                      labelText: 'Password',
                      hintText: 'Masukkan Password Anda',
                      isPassword: true,
                      isObscure: true,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const CustomTextFormField(
                      labelText: 'Konfirmasi Password',
                      hintText: 'Masukkan Konfirmasi Password Anda',
                      isPassword: true,
                      isObscure: true,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    PrimaryButton(
                      text: 'Register',
                      iconData: Icons.arrow_forward,
                      isUseIcon: true,
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Sudah punya akun ?', style: greyProxima14),
                        InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Text('  Login sekarang',
                                style: primaryProxima14))
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const CopyRightText(),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
