import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../common/utils/color.dart';
import '../../../common/utils/text_style_gilroy.dart';
import '../../../common/utils/text_style_proxima.dart';

class TrackSection extends StatelessWidget {
  const TrackSection({super.key});

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
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Track Pemeriksaan', style: primaryGilroyRegular18),
                      const SizedBox(
                        height: 12,
                      ),
                      Text('Kamu dapat mengecek progress pemeriksaanmu disini',
                          style: secondaryProxima12),
                      const SizedBox(
                        height: 16,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'Track  ',
                                style: primaryGilroyRegular14),
                            WidgetSpan(
                              child: Icon(
                                Icons.arrow_forward,
                                color: buttonColor,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 16,
            top: -20,
            child: SvgPicture.asset("assets/images/ic_track.svg"),
          )
        ],
      ),
    );
  }
}
