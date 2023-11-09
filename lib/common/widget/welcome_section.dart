import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../utils/text_style_gilroy.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Hai, ',
                style: primaryGilroyRegular28,
              ),
              TextSpan(
                text: 'Selamat Datang',
                style: primaryGilroyExtraBold28,
              ),
            ],
          ),
        ),
        Text(
          'Silahkan login untuk melanjutkan',
          style: secondaryGilroyRegular12,
        ),
        Image(
          image: const AssetImage("assets/images/image_login.png"),
          fit: BoxFit.fill,
          width: Get.width,
        ),
      ],
    );
  }

}