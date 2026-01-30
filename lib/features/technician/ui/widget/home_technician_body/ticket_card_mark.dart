import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketStateMark extends StatelessWidget {
  final String statut;

  const TicketStateMark({
    super.key,
    required this.statut,
  });

  @override
  Widget build(BuildContext context) {
    final statusData = _getStatusData(statut);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: statusData['background'],
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: (statusData['text'] as Color).withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Text(
        statusData['label'],
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: statusData['text'],
        ),
      ),
    );
  }

  Map<String, dynamic> _getStatusData(String statut) {
    switch (statut.toLowerCase()) {
      case 'en_cours':
        return {
          'label': 'Active',
          'background': Color(0xFFE3F2FD),
          'text': Color(0xFF1976D2),
        };
      case 'ferme':
        return {
          'label': 'Done',
          'background': Color(0xFFE8F5E9),
          'text': Color(0xFF388E3C),
        };
      default:
        return {
          'label': 'Pending',
          'background': Color(0xFFFFF4E6),
          'text': Color(0xFFE67E22),
        };
    }
  }
}