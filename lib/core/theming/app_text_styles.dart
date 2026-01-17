import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/theming/app_colors_manager.dart';
import 'package:help_desktops/core/theming/app_text_font_weight.dart';

class AppTextStyles {
  static TextStyle font24DarkBlueMedium = TextStyle(
    fontSize: 24.sp,
    fontWeight: AppTextFontWeight.semiBold,
    color: AppColorsManager.darkBlue,
  );

  static TextStyle font24DarkBlueBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: AppTextFontWeight.bold,
    color: AppColorsManager.darkBlue,
  );

  static TextStyle font16DarkBlueMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: AppTextFontWeight.medium,
    color: AppColorsManager.darkBlue,
  );
  static TextStyle font14GrayMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: AppTextFontWeight.medium,
    color: AppColorsManager.lighterGray,
  );
  static TextStyle font14MainBlueMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: AppTextFontWeight.medium,
    color: AppColorsManager.mainBlue,
  );
  static TextStyle font14DeppOrangeMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: AppTextFontWeight.medium,
    color: AppColorsManager.deepOrange,
  );
  static TextStyle font14MoreGreenMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: AppTextFontWeight.medium,
    color: AppColorsManager.moreGreen,
  );

  static TextStyle font14LighteGrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: AppTextFontWeight.regular,
    color: AppColorsManager.lighterGray,
  );

  static TextStyle font14DarkBlueMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: AppTextFontWeight.medium,
    color: AppColorsManager.darkBlue,
  );

  static TextStyle font14MainBlueSemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: AppTextFontWeight.semiBold,
    color: AppColorsManager.mainBlue,
  );

  static TextStyle font14MainBlueBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: AppTextFontWeight.bold,
    color: AppColorsManager.mainBlue,
  );

  static TextStyle font16DarkBlueSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: AppTextFontWeight.semiBold,
    color: AppColorsManager.darkBlue,
  );
}
