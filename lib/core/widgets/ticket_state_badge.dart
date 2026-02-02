import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketStateBadge extends StatelessWidget {
  final String label;
  final int count;
  final Color backgroundColor;
  final Color textColor;
  final Color glowColor;
  final bool isSelected;  // ← NEW!
  final VoidCallback? onTap;

  const TicketStateBadge({
    super.key,
    required this.label,
    required this.count,
    required this.backgroundColor,
    required this.textColor,
    required this.glowColor,
    this.isSelected = false,  // ← افتراضي false
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
          // لون أغمق إذا selected
          color: isSelected
              ? backgroundColor.withValues(alpha: 0.3)
              : backgroundColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: glowColor.withValues(alpha: isSelected ? 0.8 : 0.4),
            width: isSelected ? 3 : 1.5,  // ← حدود أعرض إذا selected
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
            // glow أقوى إذا selected
            BoxShadow(
              color: glowColor.withValues(alpha: isSelected ? 0.25 : 0.15),
              blurRadius: isSelected ? 16 : 12,
              offset: Offset(0, 0),
              spreadRadius: -2,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
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