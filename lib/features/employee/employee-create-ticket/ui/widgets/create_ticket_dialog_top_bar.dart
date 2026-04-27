import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/helpers/extensions.dart';
import 'package:help_desktops/core/theming/app_colors_manager.dart';
import 'package:help_desktops/core/theming/app_text_styles.dart';

class CreateTicketDialogTopBar extends StatelessWidget {
  const CreateTicketDialogTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColorsManager.lighterGray, width: 1.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            padding: EdgeInsets.all(12.r),
            icon: Icon(Icons.close, size: 24.r),
            onPressed: () => context.pop(true),
            constraints: BoxConstraints(minWidth: 48.r, minHeight: 48.r),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Create New Ticket',
                  style: AppTextStyles.font16DarkBlueMedium,
                  textAlign: TextAlign.center,
                  
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 48.w),
        ],
      ),
    );
  }
}
