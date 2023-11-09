import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:technical_assessment_vascomm/common/utils/color.dart';
import 'package:technical_assessment_vascomm/common/widget/primary_button.dart';

import '../../../common/utils/text_style_gilroy.dart';
import '../../../common/utils/text_style_proxima.dart';

class ItemBanner extends StatelessWidget {
  const ItemBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.only(left: 14, right: 14, top: 30, bottom: 16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: secondaryColor.withOpacity(0.2),
            blurRadius: 50,
            offset: const Offset(0, 5),
            spreadRadius: 0,
          )
        ],
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: <Color>[Colors.white, Colors.white, bannerColor]),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Solusi, ',
                              style: primaryGilroyRegular18,
                            ),
                            TextSpan(
                                text: 'Kesehatan Anda',
                                style: primaryGilroyExtraBold18),
                          ],
                        ),
                      ),
                      Text(
                          'Update informasi seputar kesehatan semua bisa disini !',
                          style: secondaryProxima12),
                      const SizedBox(
                        height: 12,
                      ),
                      PrimaryButton(
                        text: 'Selengkapnya',
                        sizeWidth: Get.width / 2.5,
                        fontSize: 12,
                        sizeHeight: 32,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                )
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: -30,
            child: SvgPicture.asset("assets/images/ic_banner.svg"),
          )
        ],
      ),
    );
  }
}
