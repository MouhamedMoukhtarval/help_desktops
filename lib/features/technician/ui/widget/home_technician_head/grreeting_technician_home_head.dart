import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/helpers/spacing.dart';
import 'package:help_desktops/core/theming/app_text_styles.dart';

class GrreetingTechnicianHomeHead extends StatelessWidget {
  const GrreetingTechnicianHomeHead({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good Evening, Bro', style: AppTextStyles.font24DarkBlueBold),
            spacingVertical(5.0),
            Text(
              'Ready to tackle chalanges! ',
              style: AppTextStyles.font14GrayMedium,
            ),
          ],
        ),
      
    );
  }
}
