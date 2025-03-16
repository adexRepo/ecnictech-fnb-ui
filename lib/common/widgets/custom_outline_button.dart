import 'package:ecnictech_fnb_ui/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final Color? outlinedColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final IconData? iconData;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  const CustomOutlineButton(
      {super.key,
      this.outlinedColor,
      this.buttonWidth,
      this.buttonHeight,
      this.iconData,
      required this.buttonText,
      required this.textStyle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = OutlinedButton.styleFrom(
      fixedSize: Size(buttonWidth ?? double.maxFinite, buttonHeight ?? 52),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      side: BorderSide(
        width: 2,
        color: outlinedColor ?? ColorsManager.mainOrange,
      ),
    );

    if (iconData != null) {
      return CustomOutlinedIconButton(
        onPressed: onPressed,
        buttonWidth: buttonWidth,
        buttonHeight: buttonHeight,
        outlinedColor: outlinedColor,
        iconData: iconData!,
        buttonText: buttonText,
        textStyle: textStyle,
        buttonStyle: buttonStyle,
      );
    } else {
      return CustomOutlinedButton(
        onPressed: onPressed,
        buttonWidth: buttonWidth,
        buttonHeight: buttonHeight,
        outlinedColor: outlinedColor,
        buttonText: buttonText,
        textStyle: textStyle,
        buttonStyle: buttonStyle,
      );
    }
  }
}

class CustomOutlinedIconButton extends StatelessWidget {
  const CustomOutlinedIconButton({
    super.key,
    required this.onPressed,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.outlinedColor,
    required this.iconData,
    required this.buttonText,
    required this.textStyle,
    required this.buttonStyle,
  });

  final VoidCallback onPressed;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? outlinedColor;
  final IconData iconData;
  final String buttonText;
  final TextStyle textStyle;
  final ButtonStyle buttonStyle;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: buttonStyle,
      icon: Icon(
        iconData,
        color: ColorsManager.mainOrange,
        size: 30.0,
      ),
      label: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.outlinedColor,
    required this.buttonText,
    required this.textStyle,
    required this.buttonStyle,
  });

  final VoidCallback onPressed;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? outlinedColor;
  final String buttonText;
  final TextStyle textStyle;
  final ButtonStyle buttonStyle;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}
