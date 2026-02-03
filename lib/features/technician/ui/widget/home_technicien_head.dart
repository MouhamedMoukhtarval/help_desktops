import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/helpers/spacing.dart';
import 'package:help_desktops/core/theming/app_color_manager.dart';
import 'package:help_desktops/core/theming/app_spacing.dart';
import 'package:help_desktops/features/technician/ui/widget/home_technician_head/alert_banner.dart';
import 'package:help_desktops/features/technician/ui/widget/home_technician_head/home_technicien_top_bar.dart';
import 'package:help_desktops/features/technician/ui/widget/home_technician_head/technician_tickets_states.dart';

class HomeTechnicienHead extends StatelessWidget {
  final String technicianName;
  final int pendingCount;
  final int activeCount;
  final int doneCount;
  final int urgentCount;
  final int overdueCount;
  final VoidCallback? onMenuPressed;
  final Function(String)? onStateTap;

  const HomeTechnicienHead({
    super.key,
    required this.technicianName,
    required this.pendingCount,
    required this.activeCount,
    required this.doneCount,
    required this.urgentCount,
    required this.overdueCount,
    this.onMenuPressed,
    this.onStateTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.h),
      width: double.infinity,
      padding: EdgeInsets.only(top: 25.r),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColorManager.warmBeige,
            AppColorManager.lightWarmGrey,
            AppColorManager.white,
          ],
          stops: [0.0, 0.5, 1.0],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28.r),
          bottomRight: Radius.circular(28.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TechnicianTopBar(
            onMenuPressed: onMenuPressed,
          ),
          
          spacingVertical(AppSpacing.lg),
          
          AlertBanner(
            urgentCount: urgentCount,
            overdueCount: overdueCount,
          ),
          
          spacingVertical(AppSpacing.xl),
          
          TechnicianTicketsStates(
            pendingCount: pendingCount,
            activeCount: activeCount,
            doneCount: doneCount,
            onStateTap: onStateTap,
          ),
          
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}