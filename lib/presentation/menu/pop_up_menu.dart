import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:technical_assessment_vascomm/common/utils/color.dart';
import 'package:technical_assessment_vascomm/common/utils/text_style_gilroy.dart';
import 'package:technical_assessment_vascomm/common/utils/text_style_proxima.dart';
import 'package:technical_assessment_vascomm/data/utils/my_pref.dart';
import 'package:technical_assessment_vascomm/presentation/get_bindings.dart';
import 'package:technical_assessment_vascomm/presentation/login/login_page.dart';
import 'package:technical_assessment_vascomm/presentation/profile/profile_page.dart';

import '../../common/widget/primary_button.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.only(left: 20),
      backgroundColor: Colors.transparent,
      content: AnimatedBuilder(
        animation: ModalRoute.of(context)!.animation!,
        builder: (context, child) {
          final double slide = 1.0 - ModalRoute.of(context)!.animation!.value;
          return Transform(
            transform: Matrix4.translationValues(slide * 300, 0.0, 0.0),
            child: child,
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 24,
                height: 24,
                margin: const EdgeInsets.symmetric(vertical: 30),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white, // inner circle color
                ),
                child: const Icon(Icons.close),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Container(
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(),
                ),
                width: Get.width,
                child: Container(
                  margin: const EdgeInsets.only(left: 25, top: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const ShapeDecoration(
                              color: Colors.black,
                              shape: OvalBorder(),
                            ),
                            child: const Image(
                              image:
                                  AssetImage("assets/images/image_profile.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Angga ',
                                      style: primaryGilroyRegular16,
                                    ),
                                    TextSpan(
                                      text: 'Praja',
                                      style: primaryGilroyRegular14,
                                    ),
                                  ],
                                ),
                              ),
                              Opacity(
                                opacity: 0.5,
                                child: Text(
                                  'Membership BBLK',
                                  style: primaryProxima11,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => const ProfilePage());
                        },
                        child: Row(
                          children: [
                            Text(
                              'Profile Saya',
                              style: greyProxima12,
                            ),
                            const SizedBox(
                              width: 60,
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              size: 16,
                              color: grey,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Text(
                            'Pengaturan',
                            style: greyProxima12,
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            size: 16,
                            color: grey,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      PrimaryButton(
                        colorButton: red,
                        borderSideColor: red,
                        elevation: 0.0,
                        borderRadiusSize: 23,
                        text: 'Logout',
                        sizeWidth: Get.width / 2.5,
                        fontSize: 12,
                        sizeHeight: 32,
                        onPressed: () {
                          Get.offAll(() => LoginPage(), binding: GetBindings());
                          var accessToken = Get.find<MyPref>().accessToken;
                          accessToken.val = '';
                        },
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Ikuti kami di', style: primaryGilroyRegular16),
                          const SizedBox(
                            width: 12,
                          ),
                          SvgPicture.asset("assets/images/ic_fb.svg"),
                          const SizedBox(
                            width: 12,
                          ),
                          SvgPicture.asset("assets/images/ic_ig.svg"),
                          const SizedBox(
                            width: 12,
                          ),
                          SvgPicture.asset("assets/images/ic_twitter.svg")
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Opacity(
                            opacity: 0.5,
                            child: Text(
                              'FAQ',
                              style: primaryProxima11,
                            ),
                          ),
                          const SizedBox(
                            width: 48,
                          ),
                          Opacity(
                            opacity: 0.5,
                            child: Text(
                              'Terms and Conditions',
                              style: primaryProxima11,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
