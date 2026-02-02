import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketStateBadge extends StatelessWidget {
  final String label;
  final int count;
  final Color backgroundColor;
  final Color textColor;
  final Color glowColor;
  final VoidCallback? onTap;

  const TicketStateBadge({
    super.key,
    required this.label,
    required this.count,
    required this.backgroundColor,
    required this.textColor,
    required this.glowColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 14.h,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: glowColor.withValues(alpha: 0.4),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
            BoxShadow(
              color: glowColor.withValues(alpha: 0.15),
              blurRadius: 12,
              offset: Offset(0, 0),
              spreadRadius: -2,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // العدد - كبير وبارز
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.w800,
                color: textColor,
                height: 1,
                letterSpacing: -0.5,
              ),
            ),
            
            SizedBox(height: 6.h),
            
            // التسمية
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: textColor.withValues(alpha: 0.85),
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}