// lib/features/admin/admin_dashboard_screen.dart

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_desktops/core/di/dependcy_injection.dart';
import 'package:help_desktops/core/helpers/extensions.dart';
import 'package:help_desktops/core/networking/api_result.dart';
import 'package:help_desktops/core/routes/routes.dart';
import 'package:help_desktops/features/admin/data/repos/admin_repo.dart';
import '../data/models/ticket.dart';
import 'widget/ticket_card.dart';
import 'widget/filter_buttons.dart';
import 'users_screen.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedFilter = 'all';
  List<Ticket> _allTickets = [];

  @override
  void initState() {
    
    super.initState();
    _initializeDummyData();
    _tabController = TabController(length: 2, vsync: this);
    
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _initializeDummyData() async {
    final result = await getit<AdminRepo>().getTicketsList();
    result.when(
      success: (tickets) {
        setState(() {
          _allTickets = tickets.tickets;
        });
      },
      failure: (error) {
        // Handle error appropriately
        if (kDebugMode) {
          print("Error fetching tickets: $error");
        }
      }
    );
   
  }

  List<Ticket?> get _filteredTickets {
    if (_selectedFilter == 'all') {
      return _allTickets as List<Ticket?>;
    }
    return _allTickets
        .where((ticket) => ticket.statut == _selectedFilter)
        .toList();
  }

  int get _unassignedCount {
    return _allTickets.where((ticket) => ticket.assigneA == null).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.grey.shade50,
            body: SafeArea(
              child: Column(
                children: [
                  // Header
                  Container(
                    padding:  EdgeInsets.all(20.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: .1),
                          spreadRadius: 1.dg,
                          blurRadius: 3.dg,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                             CircleAvatar(
                              radius: 20.r,
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                             SizedBox(width: 12.w),
                             Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hello, Nevisse',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Manager Dashboard',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.notifications_outlined,
                              color: Colors.grey.shade700,
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'You have $_unassignedCount unassigned issues.',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // TabBar
                  Container(
                    color: Colors.white,
                    child: TabBar(
                      controller: _tabController,
                      labelColor: Colors.blue.shade600,
                      unselectedLabelColor: Colors.grey.shade600,
                      indicatorColor: Colors.blue.shade600,
                      indicatorWeight: 3,
                      tabs: const [
                        Tab(text: 'Tickets'),
                        Tab(text: 'Users'),
                      ],
                    ),
                  ),

                  // TabBarView
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // Tickets Tab
                        _buildTicketsTab(),

                        // Users Tab
                        const UsersScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            floatingActionButton: _tabController.index == 0
                ? FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.blue.shade600,
                    child: const Icon(Icons.add),
                  )
                : null,
          );
  }

  Widget _buildTicketsTab() {
    return Column(
      children: [
        FilterButtons(
          selectedFilter: _selectedFilter,
          onFilterChanged: (newFilter) {
            setState(() {
              _selectedFilter = newFilter;
            });
          },
        ),

        Expanded(
          child: _filteredTickets.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.inbox_outlined,
                        size: 80.r,
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'No tickets found',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: _filteredTickets.length,
                  itemBuilder: (context, index) {
                    return TicketCard(
                      ticket: _filteredTickets[index]!,
                      onAssignTap: () {
                        _showAssignDialog(_filteredTickets[index]!);
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }

  void _showAssignDialog(Ticket ticket) {
    context.pushNamed(Routes.assignTechnicianScreen, arguments: ticket);
  }
}
