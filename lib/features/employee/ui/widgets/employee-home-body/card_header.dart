import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/features/technician/ui/widget/home_technician_body/ticket_card_mark.dart';

class CardHeader extends StatelessWidget {
  final String statut;
  final int ticketId;

  const CardHeader({super.key, required this.statut, required this.ticketId});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TicketStateMark(statut: statut),
        Spacer(),
        Text(
          '#$ticketId',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
