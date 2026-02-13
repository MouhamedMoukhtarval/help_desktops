import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/theming/app_color_manager.dart';
import 'package:help_desktops/core/widgets/ticket_state_badge.dart';

class EmployeeIcketStates extends StatelessWidget {
  final int peningCount;
  final int inProgressCount;
  final int resolvedCount;
  final String selectedState;
  final Function(String) onStateSelected;
  const EmployeeIcketStates({
    super.key,
    required this.peningCount,
    required this.inProgressCount,
    required this.resolvedCount,
    required this.selectedState,
    required this.onStateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TicketStateBadge(
            label: "Pending",
            count: peningCount,
            backgroundColor: AppColorManager.pendingBackground,
            textColor: AppColorManager.pendingText,
            glowColor: AppColorManager.pendingGlow,
            isSelected: selectedState == "pending",
            onTap: () => onStateSelected.call("pending"),
          ),
          TicketStateBadge(
            label: "In Progress",
            count: inProgressCount,
            backgroundColor: AppColorManager.activeBackground,
            textColor: AppColorManager.activeText,
            glowColor: AppColorManager.activeGlow,
            isSelected: selectedState == "active",
            onTap: () => onStateSelected.call("active"),
          ),
          TicketStateBadge(
            label: "Resolved",
            count: resolvedCount,
            backgroundColor: AppColorManager.doneBackground,
            textColor: AppColorManager.doneText,
            glowColor: AppColorManager.doneGlow,
            isSelected: selectedState == "done",
            onTap: () => onStateSelected.call("done"),
          ),
        ],
      ),
    );
  }
}
