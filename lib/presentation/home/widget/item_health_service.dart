import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technical_assessment_vascomm/common/utils/color.dart';
import 'package:technical_assessment_vascomm/common/utils/int_ext.dart';
import 'package:technical_assessment_vascomm/domain/entities/health_service.dart';

import '../../../common/utils/text_style_proxima.dart';

class ItemHealthService extends StatelessWidget {
  const ItemHealthService({super.key, required this.healthService});

  final HealthService healthService;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: [
          BoxShadow(
            color: shadow.withOpacity(0.1),
            blurRadius: 24,
            offset: const Offset(0, 16),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    healthService.name,
                    style: primaryProxima14,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    healthService.price.formatIDR() ?? '',
                    style: orangeProxima14,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/ic_hospital.svg"),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        healthService.hospital,
                        style: greyProxima14,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/ic_location.svg"),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        healthService.location,
                        style: greyProxima14,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image(
                image: AssetImage(healthService.image),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
