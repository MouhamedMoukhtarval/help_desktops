import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/theming/app_color_manager.dart';

class AlertBanner extends StatelessWidget {
  final int urgentCount;
  final int overdueCount;

  const AlertBanner({
    super.key,
    required this.urgentCount,
    required this.overdueCount,
  });

  @override
  Widget build(BuildContext context) {
    if (urgentCount == 0 && overdueCount == 0) {
      return _buildSuccessBanner();
    }
    
    return _buildWarningBanner();
  }

  Widget _buildSuccessBanner() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColorManager.doneBackground,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColorManager.doneGlow.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_outline,
            color: AppColorManager.doneText,
            size: 20.r,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              'All tasks under control ',
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColorManager.doneText,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarningBanner() {
    String message = _buildMessage();
    
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColorManager.urgentRedLight,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColorManager.urgentRed.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: AppColorManager.urgentRed,
                size: 20.r,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColorManager.urgentRed,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          
          if (urgentCount > 0 && overdueCount > 0) ...[
            SizedBox(height: 6.h),
            Text(
              'Focus on urgent tasks first, then overdue',
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColorManager.urgentRed.withValues(alpha: 0.8),
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _buildMessage() {
    if (urgentCount > 0 && overdueCount > 0) {
      return '$urgentCount urgent and $overdueCount overdue tasks need your attention';
    } else if (urgentCount > 0) {
      return '$urgentCount urgent ${urgentCount == 1 ? 'task' : 'tasks'} need your attention';
    } else {
      return '$overdueCount overdue ${overdueCount == 1 ? 'task' : 'tasks'} need your attention';
    }
  }
}