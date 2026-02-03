import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/theming/app_color_manager.dart';
import 'package:help_desktops/core/widgets/ticket_state_badge.dart';


class TechnicianTicketStates extends StatelessWidget {
  final int pendingCount;
  final int activeCount;
  final int doneCount;
  final String selectedStatus;  // ← NEW! لمعرفة أي واحد محدد
  final Function(String)? onStateTap;

  const TechnicianTicketStates({
    super.key,
    required this.pendingCount,
    required this.activeCount,
    required this.doneCount,
    required this.selectedStatus,
    this.onStateTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: TicketStateBadge(
              label: 'Pending',
              count: pendingCount,
              backgroundColor: AppColorManager.pendingBackground,
              textColor: AppColorManager.pendingText,
              glowColor: AppColorManager.pendingGlow,
              isSelected: selectedStatus == 'pending',  // ← التحقق
              onTap: () => onStateTap?.call('pending'),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: TicketStateBadge(
              label: 'Active',
              count: activeCount,
              backgroundColor: AppColorManager.activeBackground,
              textColor: AppColorManager.activeText,
              glowColor: AppColorManager.activeGlow,
              isSelected: selectedStatus == 'active',
              onTap: () => onStateTap?.call('active'),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: TicketStateBadge(
              label: 'Done',
              count: doneCount,
              backgroundColor: AppColorManager.doneBackground,
              textColor: AppColorManager.doneText,
              glowColor: AppColorManager.doneGlow,
              isSelected: selectedStatus == 'done',
              onTap: () => onStateTap?.call('done'),
            ),
          ),
        ],
      ),
    );
  }
}