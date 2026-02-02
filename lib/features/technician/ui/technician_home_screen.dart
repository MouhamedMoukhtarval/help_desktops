import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/features/technician/logic/tech_home_cubit.dart';
import 'package:help_desktops/features/technician/logic/tech_home_states.dart';
import 'package:help_desktops/features/technician/ui/widget/home_technicien_head.dart';
import 'package:help_desktops/features/technician/ui/widget/technician_home_screen_body.dart';

class TechnicianHomeScreen extends StatelessWidget {
  const TechnicianHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: BlocBuilder<TechnicianHomeCubit, TechHomeStates>(
          buildWhen: (previous, current) {
            // نتجاهل Initial فقط
            return current is Loading ||
                current is Success ||
                current is Error;
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
              
              success: (tickets, selectedStatus, priorityFilter, dateFrom, dateTo) {
                final cubit = context.read<TechnicianHomeCubit>();
                
                return Column(
                  children: [
                    // الـ Head
                    HomeTechnicianHead(
                      technicianName: 'Technician',  // من Auth/SharedPreferences
                      pendingCount: cubit.pendingCount,
                      activeCount: cubit.activeCount,
                      doneCount: cubit.doneCount,
                      urgentCount: cubit.urgentCount,
                      overdueCount: cubit.overdueCount,
                      selectedStatus: selectedStatus,  // ← من الـ state
                      priorityFilter: priorityFilter,
                      dateFrom: dateFrom,
                      dateTo: dateTo,
                      onMenuPressed: () {
                        // فتح drawer/menu
                      },
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
                    
                    // الـ Body
                    Expanded(
                      child: TechnicianHomeScreenBody(
                        tickets: cubit.filteredTickets,
                        onStartWorking: (id) => cubit.startWorking(id),
                        onResolve: (id) {
                          // فتح resolve dialog
                          // showDialog(...)
                        },
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
                        onPressed: () => context.read<TechnicianHomeCubit>().loadTickets(),
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
    );
  }
}