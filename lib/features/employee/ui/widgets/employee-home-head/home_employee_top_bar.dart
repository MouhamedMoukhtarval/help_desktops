import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/theming/app_text_styles.dart';

class HomeEmployeeTopBar extends StatelessWidget {
  final VoidCallback? onMenuPressed; 
  const HomeEmployeeTopBar({super.key, this.onMenuPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onMenuPressed,
            icon: Icon(Icons.menu, size: 24.r),
            padding: EdgeInsets.all(8.r),
            constraints: BoxConstraints(minWidth: 40.w, minHeight: 40.h),
          ),
          Text("Dashboard", style: AppTextStyles.font16DarkBlueSemiBold),
          const SizedBox(width: 32), // Placeholder for spacing
        ],
      ),
    );
  }
}
