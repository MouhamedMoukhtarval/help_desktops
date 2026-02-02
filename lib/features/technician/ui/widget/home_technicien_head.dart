import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/theming/app_color_manager.dart';
import 'package:help_desktops/features/technician/ui/widget/home_technician_head/alert_banner.dart';
import 'package:help_desktops/features/technician/ui/widget/home_technician_head/filter_row.dart';
import 'package:help_desktops/features/technician/ui/widget/home_technician_head/home_technicien_top_bar.dart';
import 'package:help_desktops/features/technician/ui/widget/home_technician_head/technician_tickets_states.dart';


class HomeTechnicianHead extends StatelessWidget {
  final String technicianName;
  final int pendingCount;
  final int activeCount;
  final int doneCount;
  final int urgentCount;
  final int overdueCount;
  final String selectedStatus;  // ← NEW!
  final String priorityFilter;
  final DateTime? dateFrom;
  final DateTime? dateTo;
  final VoidCallback onMenuPressed;
  final Function(String)? onStateTap;
  final Function(String) onPriorityChanged;
  final Function(DateTime?, DateTime?) onDateChanged;

  const HomeTechnicianHead({
    super.key,
    required this.technicianName,
    required this.pendingCount,
    required this.activeCount,
    required this.doneCount,
    required this.urgentCount,
    required this.overdueCount,
    required this.selectedStatus,
    required this.priorityFilter,
    this.dateFrom,
    this.dateTo,
    required this.onMenuPressed,
    this.onStateTap,
    required this.onPriorityChanged,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TechnicianTopBar(onMenuPressed: onMenuPressed),
          SizedBox(height: 16.h),
          AlertBanner(
            urgentCount: urgentCount,
            overdueCount: overdueCount,
          ),
          SizedBox(height: 20.h),
          TechnicianTicketStates(
            pendingCount: pendingCount,
            activeCount: activeCount,
            doneCount: doneCount,
            selectedStatus: selectedStatus,  // ← تمرير الحالة المحددة
            onStateTap: onStateTap,
          ),
          SizedBox(height: 12.h),
          FilterRow(
            priorityFilter: priorityFilter,
            dateFrom: dateFrom,
            dateTo: dateTo,
            onPriorityChanged: onPriorityChanged,
            onDateChanged: onDateChanged,
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}