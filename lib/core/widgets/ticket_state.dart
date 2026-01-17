import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/helpers/spacing.dart';
import 'package:help_desktops/core/theming/app_colors_manager.dart';
import 'package:help_desktops/core/theming/app_text_styles.dart';

Widget stateTicket({
  BuildContext? context,
  required String lable,
  String? value,
  TextStyle? labelStyle,
  Color? backgroundColor,
  Color? textColor,
  VoidCallback? onTap,
  bool? isTicketState = false,
}) {
  return GestureDetector(
    onTap: isTicketState! ? null : onTap,
    child: Container(
      padding: isTicketState ? EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.w) : EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.w),
      width: isTicketState ? null : 100.w,
      height: isTicketState ? null : 80.h,
      decoration: BoxDecoration(
        color:
            backgroundColor ?? AppColorsManager.lightBlue.withValues(alpha: .2),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: textColor ?? AppColorsManager.mainBlue,
          width: 1.w,
        ),
      ),
      child: isTicketState ?
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 16.r,
                  backgroundColor: textColor ?? AppColorsManager.mainBlue,
                ),
                const Spacer(),
                Text(
                  lable,
                  style: labelStyle ?? AppTextStyles.font14MainBlueSemiBold,
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  lable,
                  style: labelStyle ?? AppTextStyles.font14MainBlueBold,
                ),
                spacingVertical(5.0),
                Text(
                  value!,
                  style: labelStyle ?? AppTextStyles.font14MainBlueBold,
                ),
              ],
            ),
    ),
  );
}
