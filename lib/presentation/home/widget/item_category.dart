import 'package:flutter/material.dart';
import 'package:technical_assessment_vascomm/common/utils/color.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory(
      {super.key, this.onTap, this.isSelected, required this.category});

  final VoidCallback? onTap;
  final bool? isSelected;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: ShapeDecoration(
              color: isSelected ?? false ? buttonColor : Colors.white,
              shadows: [
                BoxShadow(
                  color: buttonColor.withOpacity(0.1),
                  blurRadius: 24,
                  offset: const Offset(0, 20),
                  spreadRadius: 0,
                ),
              ],
              shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: 1,
                    color: isSelected ?? false ? buttonColor : Colors.white),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Center(
              child: Text(
                category,
                style: TextStyle(
                  color: (isSelected ?? false) ? Colors.white : buttonColor,
                  fontSize: 12,
                  fontFamily: 'Proxima-Nova',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
