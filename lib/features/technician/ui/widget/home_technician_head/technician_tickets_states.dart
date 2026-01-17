import 'package:flutter/material.dart';
import 'package:help_desktops/core/theming/app_colors_manager.dart';
import 'package:help_desktops/core/theming/app_text_styles.dart';
import 'package:help_desktops/core/widgets/ticket_state.dart';

class TechnicianTicketsStates extends StatelessWidget {
  const TechnicianTicketsStates({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          stateTicket(
            lable: 'Pending',
            value: '8',
            labelStyle: AppTextStyles.font14DeppOrangeMedium,
            backgroundColor: AppColorsManager.yellowOrange,
            textColor: AppColorsManager.deepOrange,
          ),
          const Spacer(),
          stateTicket(lable: 'Resolve', value: '7'),
          const Spacer(),
          stateTicket(
            lable: 'Done',
            value: '5',
            labelStyle: AppTextStyles.font14MoreGreenMedium,
            backgroundColor: AppColorsManager.lightGreen,
            textColor: AppColorsManager.moreGreen,
          ),
        ],
      ),
    );
  }
}
