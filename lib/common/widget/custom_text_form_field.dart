import 'package:flutter/material.dart';
import 'package:technical_assessment_vascomm/common/utils/color.dart';
import 'package:technical_assessment_vascomm/common/utils/text_style_gilroy.dart';

import '../utils/text_style_proxima.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final bool? isObscure;
  final bool? isPassword;
  final bool? isRequired;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final AutovalidateMode? autoValidateMode;
  final bool? isShowForgoPassword;
  final TextInputType? textInputType;

  const CustomTextFormField(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.isObscure,
      this.isPassword,
      this.isRequired,
      this.controller,
      this.validator,
      this.onChanged,
      this.autoValidateMode,
      this.isShowForgoPassword,
      this.textInputType});

  @override
  CustomTextFormFieldState createState() {
    return CustomTextFormFieldState();
  }
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  bool passwordVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.labelText, style: primaryGilroyRegular16),
            Visibility(
                visible: widget.isShowForgoPassword ?? false,
                child: Text(
                  'Lupa Password Anda?',
                  style: secondaryProxima14,
                ))
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            shadows: [
              BoxShadow(
                color: shadow,
                blurRadius: 24,
                offset: const Offset(0, 16),
                spreadRadius: 0,
              )
            ],
          ),
          child: TextFormField(
            autovalidateMode: widget.autoValidateMode,
            keyboardType: widget.textInputType ?? TextInputType.text,
            onChanged: widget.onChanged,
            cursorColor: primaryColor,
            controller: widget.controller,
            obscureText: widget.isObscure ?? false ? passwordVisibility : false,
            validator: widget.validator,
            style: secondaryGilroyRegular12,
            decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: widget.hintText,
                hintStyle: greyGilroyRegular12,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: widget.isPassword ?? false
                    ? IconButton(
                        icon: Icon(
                          passwordVisibility
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            passwordVisibility = !passwordVisibility;
                          });
                        },
                      )
                    : null),
          ),
        )
      ],
    );
  }
}
