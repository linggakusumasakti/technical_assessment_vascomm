import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:technical_assessment_vascomm/common/utils/color.dart';
import 'package:technical_assessment_vascomm/common/utils/text_style_gilroy.dart';
import 'package:technical_assessment_vascomm/common/utils/text_style_proxima.dart';

class NotificationSection extends StatelessWidget {
  const NotificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 107,
      width: Get.width,
      decoration: BoxDecoration(color: buttonColor),
      child: Stack(
        children: [
          SvgPicture.asset(
            "assets/images/ic_bg_notification.svg",
          ),
          Positioned(
            top: 30,
            left: 22,
            child: Text(
              'Ingin mendapat update\ndari kami ?',
              style: whiteGilroyRegular16,
            ),
          ),
          Positioned(
            right: 80,
            top: 20,
            child: SvgPicture.asset(
              "assets/images/ic_bg_notification_2.svg",
            ),
          ),
          Positioned(
            right: 16,
            top: 30,
            child: Row(
              children: [
                Text(
                  'Dapatkan\nnotifikasi',
                  style: whiteProxima14,
                ),
                const SizedBox(width: 16,),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 16,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
