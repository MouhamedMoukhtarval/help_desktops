import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/theming/app_colors_manager.dart';
import 'package:help_desktops/core/theming/app_text_styles.dart';
class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final Color? fieldBgColor;
  final String hintText;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final TextEditingController? controller;
  final Function(String?) validator;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.suffixIcon,
    this.isObscureText,
    this.fieldBgColor,
    this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:contentPadding ?? EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 18.h
          ),
        focusedBorder: focusedBorder ?? OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColorsManager.mainBlue,
            width: 1.4
          ),
          borderRadius: BorderRadius.circular(16.0)
        ),
        enabledBorder: enabledBorder ?? OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColorsManager.lighterGray,
            width: 1.4
          ),
          borderRadius: BorderRadius.circular(16.0)
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColorsManager.red,
            width: 1.4
          ),
          borderRadius: BorderRadius.circular(16.0)
        ),
         focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColorsManager.red,
            width: 1.4
          ),
          borderRadius: BorderRadius.circular(16.0)
        ),
        fillColor: fieldBgColor ?? AppColorsManager.whiteSmoke,
        filled: true,
        hintStyle: hintStyle ?? AppTextStyles.font14LighteGrayRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      obscureText: isObscureText ?? false,
      style: AppTextStyles.font14DarkBlueMedium,
      validator: (value) => validator(value),
    );
  }
}