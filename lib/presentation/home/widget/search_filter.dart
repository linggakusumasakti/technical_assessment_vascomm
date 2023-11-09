import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:technical_assessment_vascomm/common/utils/color.dart';
import 'package:technical_assessment_vascomm/common/utils/text_style_proxima.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: const OvalBorder(),
              shadows: [
                BoxShadow(
                  color: shadow,
                  blurRadius: 24,
                  offset: const Offset(0, 16),
                  spreadRadius: 10,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(
                "assets/images/ic_filter.svg",
              ),
            ),
          ),
          const SizedBox(width: 15,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: shadow.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 40,
                  offset: const Offset(0, 10),
                )
              ]),
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: greyProxima16,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(Icons.search, color: buttonColor,),
                    ),
                    contentPadding: const EdgeInsets.all(8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
