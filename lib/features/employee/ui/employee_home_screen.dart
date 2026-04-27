import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/di/dependcy_injection.dart';
import 'package:help_desktops/core/theming/app_color_manager.dart';
import 'package:help_desktops/features/employee/employee-create-ticket/ui/create_ticket_dialog.dart';
import 'package:help_desktops/features/employee/logic/employee_home_cubit.dart';
import 'package:help_desktops/features/employee/logic/employee_home_states.dart';
import 'package:help_desktops/features/employee/ui/widgets/employee-home-body/ticket_details_dialog.dart';
import 'package:help_desktops/features/employee/ui/widgets/home_employee_body.dart';
import 'package:help_desktops/features/employee/ui/widgets/home_employee_head.dart';

class EmployeeHomeScreen extends StatelessWidget {
  const EmployeeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColorManager.activeGlow,
        child: Icon(Icons.add, color: AppColorManager.white, size: 24.sp),
        onPressed: () async{
          await showDialog(
            context: context, 
            builder: (context)=> BlocProvider(
              create: (context)=> getit<EmployeeHomeCubit>(),
              child: CreateTicketDialog(),
            )
          );
          if (!context.mounted) return;
          context.read<EmployeeHomeCubit>().refresh();
        },
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: BlocListener<EmployeeHomeCubit, EmployeeHomeStates>(
          listenWhen: (previous, current) => current is Success,
          listener: (context, state) {
            state.maybeWhen(
              success:
                  (
                    tickets,
                    tiketDetails,
                    selectedStatus,
                    selectedPriority,
                    dateFrom,
                    dateTo,
                  ) {
                    if (tiketDetails != null) {
                      showDialog(
                        context: context,
                        builder: (context) =>
                            TicketDetailsDialog(details: tiketDetails),
                      ).then((_) {
                        if (!context.mounted) return;
                        context.read<EmployeeHomeCubit>().clearTicketDetails();
                      });
                    }
                  },
              orElse: () {},
            );
          },
          child: BlocBuilder<EmployeeHomeCubit, EmployeeHomeStates>(
            buildWhen: (previous, current) {
              return current is Loading ||
                  current is Success ||
                  current is Error;
            },
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => Center(child: CircularProgressIndicator()),

                success:
                    (
                      _,
                      tickets,
                      selectedStatus,
                      priorityFilter,
                      dateFrom,
                      dateTo,
                    ) {
                      final cubit = context.read<EmployeeHomeCubit>();

                      return Column(
                        children: [
                          HomeEmployeeHead(
                            pendingCount: cubit.pendingCount,
                            activeCount: cubit.activeCount,
                            doneCount: cubit.doneCount,
                            selectedStatus: selectedStatus,
                            priorityFilter: priorityFilter,
                            dateFrom: dateFrom,
                            dateTo: dateTo,
                            onMenuPressed: () {},
                            onStateTap: (status) {
                              cubit.selectStatus(status);
                            },
                            onPriorityChanged: (filter) {
                              cubit.setPriorityFilter(filter);
                            },
                            onDateChanged: (from, to) {
                              cubit.setDateFilter(from, to);
                            },
                          ),

                          Divider(height: 1, thickness: 1),

                          Expanded(
                            child: HomeEmployeeBody(
                              tickets: cubit.filteredTickets,
                              getDetails: (id) => cubit.getDetails(id),
                            ),
                          ),
                        ],
                      );
                    },

                error: (message) => Center(
                  child: Padding(
                    padding: EdgeInsets.all(24.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 64.r,
                          color: Colors.red.shade400,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          message!,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey.shade700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 24.h),
                        ElevatedButton(
                          onPressed: () =>
                              context.read<EmployeeHomeCubit>().loadTickets(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                              horizontal: 32.w,
                              vertical: 12.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Text(
                            'Retry',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                orElse: () => SizedBox.shrink(),
              );
            },
          ),
        ),
      ),
    );
  }
}
