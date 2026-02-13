import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyCardTicket extends StatelessWidget {
  const EmptyCardTicket({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 64.r,
            color: Colors.grey.shade400,
          ),
          SizedBox(height: 16.h),
          Text(
            'You have no tickets to view, create one now!',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
