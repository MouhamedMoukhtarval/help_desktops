import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/features/employee/data/models/ticket_employee_response.dart';
import 'package:help_desktops/features/employee/ui/widgets/employee-home-body/button_get_details.dart';
import 'package:help_desktops/features/employee/ui/widgets/employee-home-body/card_content.dart';
import 'package:help_desktops/features/employee/ui/widgets/employee-home-body/card_footer.dart';
import 'package:help_desktops/features/technician/ui/widget/home_technician_body/ticket_card_header.dart';

class TicketCard extends StatelessWidget {
  final TicketEmployeeResponse ticket;
  final VoidCallback getDetails;

  const TicketCard({super.key, required this.ticket, required this.getDetails});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border(
          left: BorderSide(
            color: _getPriorityColor(ticket.priority!),
            width: 4.w,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TicketCardHeader(statut: ticket.status!, ticketId: ticket.id!),
            SizedBox(height: 12.h),
            CardContent(
              titre: ticket.title!,
              description: ticket.description!,
              pieceJointe: ticket.pieceJointe,
            ),
            SizedBox(height: 12.h),
            CardFooter(
              username: ticket.employee!.username!,
              dateCreation: DateTime.parse(ticket.dateCreation!),
            ),

            SizedBox(height: 16.h),
            ButtonGetDetails(onPressed: getDetails),
          ],
        ),
      ),
    );
  }

  Color _getPriorityColor(String priorite) {
    switch (priorite.toLowerCase()) {
      case 'haute':
        return Color(0xFFD32F2F);
      case 'moyenne':
        return Color(0xFFF57C00);
      default:
        return Color(0xFF388E3C);
    }
  }
}
