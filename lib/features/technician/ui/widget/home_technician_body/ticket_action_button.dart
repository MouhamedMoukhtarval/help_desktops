import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketActionButton extends StatelessWidget {
  final bool isActive;
  final VoidCallback onPressed;

  const TicketActionButton({
    super.key,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? Colors.white : Colors.blue,
          foregroundColor: isActive ? Colors.blue : Colors.white,
          side: isActive ? BorderSide(color: Colors.blue, width: 2) : null,
          elevation: isActive ? 0 : 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Text(
          isActive ? 'Mark as Resolved' : 'Start Working',
          style: TextStyle(
            fontSize: 15.sp,
            color: isActive ? Colors.blue : Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}