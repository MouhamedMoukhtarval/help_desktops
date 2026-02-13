import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/helpers/spacing.dart';
import 'package:help_desktops/core/theming/app_color_manager.dart';
import 'package:help_desktops/core/theming/app_colors_manager.dart';
import 'package:help_desktops/features/employee/ui/widgets/employee-home-head/employee_filter_row.dart';
import 'package:help_desktops/features/employee/ui/widgets/employee-home-head/employee_icket_states.dart';
import 'package:help_desktops/features/employee/ui/widgets/employee-home-head/home_employee_top_bar.dart';

class HomeEmployeeHead extends StatelessWidget {
  final int pendingCount;
  final int activeCount;
  final int doneCount;
  final String selectedStatus; // ← NEW!
  final String priorityFilter;
  final DateTime? dateFrom;
  final DateTime? dateTo;
  final VoidCallback? onMenuPressed;
  final Function(String)? onStateTap;
  final Function(String) onPriorityChanged;
  final Function(DateTime?, DateTime?) onDateChanged;
  const HomeEmployeeHead({
    super.key,
    required this.pendingCount,
    required this.activeCount,
    required this.doneCount,
    required this.selectedStatus,
    required this.priorityFilter,
    this.dateFrom,
    this.dateTo,
     this.onMenuPressed,
    this.onStateTap,
    required this.onPriorityChanged,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.bottomCenter,
          colors: [
            AppColorManager.warmBeige,
            AppColorManager.lightWarmGrey,
            AppColorManager.white
          ],
          stops: [0.0, 0.5, 1.0],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28.r),
          bottomRight: Radius.circular(28.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColorsManager.black.withValues(alpha: .1),
            blurRadius: 12.r,
            offset: Offset(0, 4.h),
          ),
        ]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HomeEmployeeTopBar(onMenuPressed: onMenuPressed),
          spacingVertical(20.h),
          EmployeeIcketStates(
            peningCount: pendingCount,
            inProgressCount: activeCount,
            resolvedCount: doneCount,
            selectedState: selectedStatus,
            onStateSelected: onStateTap!,
          ),
          spacingVertical(12.h),
          EmployeeFilterRow(
            priorityFiletr: priorityFilter,
            dateFrom: dateFrom,
            dateTo: dateTo,
            onPriorityFilterChanged: onPriorityChanged,
            onDateRangeChanged: onDateChanged,
          ),
        ],
      ),
    );
  }
}
