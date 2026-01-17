import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/helpers/spacing.dart';
import 'package:help_desktops/core/theming/app_colors_manager.dart';
import 'package:help_desktops/features/technician/ui/widget/home_technician_head/grreeting_technician_home_head.dart';
import 'package:help_desktops/features/technician/ui/widget/home_technician_head/home_technicien_top_bar.dart';
import 'package:help_desktops/features/technician/ui/widget/home_technician_head/technician_tickets_states.dart';

class HomeTechnicienHead extends StatelessWidget {
  const HomeTechnicienHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: AppColorsManager.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeTechnicienTopBar(),
          const Divider(
            thickness: 1.0,
            color: AppColorsManager.lighterGray,
            indent: 0.0,
            endIndent: 0.0,
          ),
          spacingVertical(5.0),
          const GrreetingTechnicianHomeHead(),
          const TechnicianTicketsStates(),
        ],
      ),
    );
  }
}
