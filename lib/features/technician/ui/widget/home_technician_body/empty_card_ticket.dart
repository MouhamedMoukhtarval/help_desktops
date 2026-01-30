import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyTicketsView extends StatelessWidget {
  const EmptyTicketsView({super.key});

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
            'No tickets to solve!',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
