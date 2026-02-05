// lib/features/admin/admin_dashboard_screen.dart

import 'package:flutter/material.dart';
import '../../core/models/ticket.dart';
import '../../core/models/user.dart';
import 'ui/widget/ticket_card.dart';
import 'ui/widget/filter_buttons.dart';
import 'assign_technician_screen.dart';
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
  late List<Ticket> _allTickets;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _initializeDummyData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _initializeDummyData() {
    User user1 = User(
      id: 1,
      username: 'Sarah Jenkins',
      email: 'sarah@company.com',
      role: 'employe',
    );

    User user2 = User(
      id: 2,
      username: 'Michael Chen',
      email: 'michael@company.com',
      role: 'employe',
    );

    User technicien1 = User(
      id: 10,
      username: 'David Ross',
      email: 'david@company.com',
      role: 'technicien',
    );

    _allTickets = [
      Ticket(
        id: 1,
        titre: 'Printer jamming on 2nd Floor Marketing Dept',
        description: 'The main printer keeps showing paper jam error despite tray being empty.',
        priorite: 'haute',
        statut: 'nouveau',
        dateCreation: DateTime.now().toIso8601String(),
        creePar: user1,
      ),
      Ticket(
        id: 2,
        titre: 'WiFi connectivity issues in Conference Room B',
        description: 'Signal drops intermittently during video calls.',
        priorite: 'moyenne',
        statut: 'en_cours',
        dateCreation: DateTime.now().subtract(Duration(hours: 2)).toIso8601String(),
        creePar: user2,
        assigneA: technicien1,
      ),
      Ticket(
        id: 3,
        titre: 'Monitor flickering at Desk 42',
        description: 'External display keeps flashing black screen.',
        priorite: 'faible',
        statut: 'nouveau',
        dateCreation: DateTime.now().subtract(Duration(hours: 5)).toIso8601String(),
        creePar: user1,
      ),
      Ticket(
        id: 4,
        titre: 'Coffee machine leakage',
        description: 'Water leaking from the bottom of the machine in the break room.',
        priorite: 'haute',
        statut: 'resolu',
        dateCreation: DateTime.now().subtract(Duration(days: 1)).toIso8601String(),
        dateResolution: DateTime.now().subtract(Duration(hours: 3)).toIso8601String(),
        creePar: user2,
        assigneA: technicien1,
      ),
    ];
  }

  List<Ticket> get _filteredTickets {
    if (_selectedFilter == 'all') {
      return _allTickets;
    }
    return _allTickets.where((ticket) => ticket.statut == _selectedFilter).toList();
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
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello, Nevisse',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Manager Dashboard',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.notifications_outlined, color: Colors.grey.shade700),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'You have $_unassignedCount unassigned issues.',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
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
                Icon(Icons.inbox_outlined, size: 80, color: Colors.grey.shade300),
                const SizedBox(height: 16),
                Text(
                  'No tickets found',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
              : ListView.builder(
            itemCount: _filteredTickets.length,
            itemBuilder: (context, index) {
              return TicketCard(
                ticket: _filteredTickets[index],
                onAssignTap: () {
                  _showAssignDialog(_filteredTickets[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  void _showAssignDialog(Ticket ticket) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AssignTechnicianScreen(ticket: ticket),
      ),
    );
  }
}