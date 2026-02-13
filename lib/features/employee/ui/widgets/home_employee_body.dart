import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/theming/app_color_manager.dart';
import 'package:help_desktops/features/employee/ui/widgets/employee-home-body/empty_card_ticket.dart';
import 'package:help_desktops/features/employee/ui/widgets/employee-home-body/ticket_card.dart';
import 'package:help_desktops/features/employee/data/models/ticket_employee_response.dart';
import 'package:help_desktops/features/employee/logic/employee_home_cubit.dart';

class HomeEmployeeBody extends StatelessWidget {
  final List<TicketEmployeeResponse?>? tickets;
  final Function(int) getDetails;

  const HomeEmployeeBody({
    super.key,
    required this.tickets,
    required this.getDetails,
  });

  @override
  Widget build(BuildContext context) {
    if (tickets!.isEmpty) {
      return const EmptyCardTicket();
    }

    return RefreshIndicator(
      color: AppColorManager.activeText,
      onRefresh: () async {
        await context.read<EmployeeHomeCubit>().refresh();
      },
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
        itemCount: tickets!.length,
        itemBuilder: (context, index) {
          final ticket = tickets![index];
          return TicketCard(
            ticket: ticket!,
            getDetails: () => getDetails(ticket.id!),
          );
        },
      ),
    );
  }
}
