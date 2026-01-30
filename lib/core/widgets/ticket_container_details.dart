import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/helpers/spacing.dart';
import 'package:help_desktops/core/theming/app_colors_manager.dart';
import 'package:help_desktops/core/theming/app_text_styles.dart';
import 'package:help_desktops/core/widgets/app_text_button.dart';
//import 'package:help_desktops/core/widgets/ticket_state.dart';

class TicketContainerDetails extends StatelessWidget {
  const TicketContainerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.h,
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100.w,
                height: 25.h,
                padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 4.w),
                decoration: BoxDecoration(
                  color: AppColorsManager.yellowOrange.withValues(alpha: .3),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 10.r,
                      backgroundColor: AppColorsManager.deepOrange
                    ),
                    const Spacer(),
                    Text(
                      'Pending',
                      style: AppTextStyles.font14DeppOrangeMedium,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Text('10:30 AM', style: AppTextStyles.font14GrayMedium),
            ],
          ),
          spacingVertical(10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Printer Malfunction !',
                style: AppTextStyles.font16DarkBlueSemiBold,
              ),
              spacingVertical(5.0),
              Text(
                'Finance Dep - 2nd Floor',
                style: AppTextStyles.font14DarkBlueMedium,
              ),
            ],
          ),
          spacingVertical(5.0),
          Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
            ),
            child: Image.asset('assets/images/printer-picture.png'),
          ),
          spacingVertical(10.0),
          AppTextButton(
            buttonText: 'Debut du solution',
            textStyle: AppTextStyles.font14DarkBlueMedium,
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
