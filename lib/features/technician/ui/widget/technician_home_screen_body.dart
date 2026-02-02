import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/features/technician/ui/widget/home_technician_body/empty_card_ticket.dart';
import 'package:help_desktops/features/technician/ui/widget/home_technician_body/ticket_card.dart';


class TechnicianHomeScreenBody extends StatelessWidget {
  final List<dynamic>? tickets; 
  final Function(int)? onStartWorking;
  final Function(int)? onResolve;

  const TechnicianHomeScreenBody({
    super.key,
     this.tickets,
     this.onStartWorking,
     this.onResolve,
  });

  @override
  Widget build(BuildContext context) {
    if (tickets == null || tickets!.isEmpty) {
      return const EmptyTicketsView();
    }

    return ListView.builder(
      padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
      itemCount: tickets!.length,
      itemBuilder: (context, index) {
        final ticket = tickets![index];
        return EnhancedTicketCard(
          ticket: ticket,
          onStartWorking: () => onStartWorking!(ticket.id),
          onResolve: () => onResolve!(ticket.id),
        );
      },
    );
  }
}