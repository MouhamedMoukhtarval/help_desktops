import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardFooter extends StatelessWidget {
  final String username;
  final DateTime dateCreation;

  const CardFooter({
    super.key,
    required this.username,
    required this.dateCreation,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.person_outline, size: 16.r, color: Colors.grey.shade600),
        SizedBox(width: 4.w),
        Expanded(
          child: Text(
            username,
            style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade600),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 8.w),
        Icon(Icons.access_time, size: 16.r, color: Colors.grey.shade600),
        SizedBox(width: 4.w),
        Text(
          _getRelativeTime(),
          style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  String _getRelativeTime() {
    final now = DateTime.now();
    final difference = now.difference(dateCreation);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inMinutes}m ago';
    }
  }
}
