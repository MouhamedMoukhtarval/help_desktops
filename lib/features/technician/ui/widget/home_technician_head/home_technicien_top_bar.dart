import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/helpers/extensions.dart';
import 'package:help_desktops/core/theming/app_color_manager.dart';
import 'package:help_desktops/core/theming/app_text_styles.dart';

class TechnicianTopBar extends StatelessWidget {
  final VoidCallback? onMenuPressed;
  final VoidCallback? onProfilePressed;

  const TechnicianTopBar({
    super.key,
    this.onMenuPressed,
    this.onProfilePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onMenuPressed,
            icon: Icon(Icons.menu, size: 24.r),
            padding: EdgeInsets.all(8.r),
            constraints: BoxConstraints(minWidth: 40.r, minHeight: 40.r),
          ),

          Text('My Tasks', style: AppTextStyles.font18Black87Bold),

          Container(
            decoration: BoxDecoration(
              color: AppColorManager.lightWarmGrey,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColorManager.activeGlow.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: IconButton(
              onPressed: () {
                _showFilterMenu(context);
              },
              icon: Icon(
                Icons.filter_list,
                size: 20.r,
                color: AppColorManager.pendingText,
              ),
              padding: EdgeInsets.all(8.r),
              constraints: BoxConstraints(minWidth: 40.r, minHeight: 40.r),
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Filter Tasks'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.list),
              title: Text('All Pending'),
              onTap: () {
                context.pop();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.priority_high,
                color: AppColorManager.urgentRed,
              ),
              title: Text('Urgent Only'),
              onTap: () {
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
