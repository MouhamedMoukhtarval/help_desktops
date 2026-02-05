import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/theming/app_color_manager.dart';
import 'package:help_desktops/features/technician/data/models/ticket_response.dart';
import 'package:help_desktops/features/technician/logic/tech_home_cubit.dart';
import 'package:help_desktops/features/technician/ui/widget/home_technician_body/empty_card_ticket.dart';
import 'package:help_desktops/features/technician/ui/widget/home_technician_body/ticket_card.dart';

class TechnicianHomeScreenBody extends StatelessWidget {
  final List<TicketResponse?>? tickets;
  final Function(int) onStartWorking;
  final Function(TicketResponse) onResolve;

  const TechnicianHomeScreenBody({
    super.key,
    required this.tickets,
    required this.onStartWorking,
    required this.onResolve,
  });

  @override
  Widget build(BuildContext context) {
    if (tickets!.isEmpty) {
      return const EmptyTicketsView();
    }

    return RefreshIndicator(
      color: AppColorManager.activeText,
      onRefresh: () async {
        await context.read<TechnicianHomeCubit>().loadTickets();
      },
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
        itemCount: tickets!.length,
        itemBuilder: (context, index) {
          final ticket = tickets![index];
          return EnhancedTicketCard(
            ticket: ticket!,
            onStartWorking: () => onStartWorking(ticket.id!),
            onResolve: () => onResolve(ticket),
          );
        },
      ),
    );
  }
}
