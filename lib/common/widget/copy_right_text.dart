import 'package:flutter/material.dart';

import '../utils/color.dart';
import '../utils/text_style_proxima.dart';

class CopyRightText extends StatelessWidget {
  const CopyRightText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(
              Icons.copyright,
              color: grey.withOpacity(0.5),
              size: 14,
            ),
          ),
          TextSpan(
              text: " SILK. all right reserved",
              style: greyProxima12),
        ],
      ),
    );
  }

}