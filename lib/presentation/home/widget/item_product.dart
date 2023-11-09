import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_assessment_vascomm/common/utils/color.dart';
import 'package:technical_assessment_vascomm/common/utils/int_ext.dart';
import 'package:technical_assessment_vascomm/domain/entities/product.dart';

import '../../../common/utils/text_style_proxima.dart';

class ItemProduct extends StatelessWidget {
  const ItemProduct({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.width / 2.5,
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            shadows: [
              BoxShadow(
                color: shadow.withOpacity(0.1),
                blurRadius: 50,
                offset: const Offset(0, 1),
                spreadRadius: 30,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: const Icon(
                      Icons.star,
                      color: Colors.amberAccent,
                    ),
                  ),
                  Text(
                    product.rating.toString(),
                    style: greyProxima16,
                  )
                ],
              ),
              const Image(
                image: AssetImage("assets/images/image_product.png"),
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 12,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  product.name,
                  style: primaryProxima14,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.price.formatIDR() ?? '',
                    style: orangeProxima12,
                  ),
                  Visibility(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFB3FFCB),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    child: Text(
                      'Ready Stock',
                      style: greenProxima10,
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 20,)
      ],
    );
  }
}
