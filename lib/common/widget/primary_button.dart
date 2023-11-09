import 'package:flutter/material.dart';
import 'package:technical_assessment_vascomm/common/utils/color.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final double? sizeWidth;
  final double? sizeHeight;
  final double? borderRadiusSize;
  final Color? borderSideColor;
  final Color? colorButton;
  final Color? textColor;
  final double? fontSize;
  final double? elevation;
  final double? letterSpacing;
  final IconData? iconData;
  final bool? isLoading;
  final bool? isUseIcon;

  const PrimaryButton(
      {Key? key,
      this.text,
      this.onPressed,
      this.sizeWidth,
      this.sizeHeight,
      this.borderRadiusSize,
      this.borderSideColor,
      this.colorButton,
      this.textColor,
      this.fontSize,
      this.elevation,
      this.letterSpacing,
      this.iconData,
      this.isLoading,
      this.isUseIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          Size(sizeWidth ?? double.infinity, sizeHeight ?? 50),
        ),
        backgroundColor: MaterialStateProperty.all(colorButton ?? buttonColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusSize ?? 8),
          ),
        ),
        side: MaterialStateProperty.all(
          BorderSide(color: borderSideColor ?? buttonColor),
        ),
        elevation: MaterialStateProperty.all(elevation ?? 2),
      ),
      child: Row(
        children: [
          const Spacer(),
          _labelText(),
          const Spacer(),
          Visibility(
            visible: !(isLoading ?? false) && (isUseIcon ?? false),
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _labelText() {
    if (isLoading ?? false) {
      return const CircularProgressIndicator(
        color: Colors.white,
      );
    }
    return Text(text ?? "",
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize ?? 16,
          fontFamily: 'Gilroy-Regular',
          fontWeight: FontWeight.w600,
        ));
  }
}
