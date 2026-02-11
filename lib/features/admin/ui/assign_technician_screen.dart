// lib/features/admin/assign_technician_screen.dart

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:help_desktops/core/di/dependcy_injection.dart';
import 'package:help_desktops/core/helpers/extensions.dart';
import 'package:help_desktops/core/networking/api_result.dart';
import 'package:help_desktops/core/routes/routes.dart';
import 'package:help_desktops/features/admin/data/repos/admin_repo.dart';
import '../data/models/ticket.dart';
import '../data/models/user.dart';
import 'widget/ticket_info_header.dart';
import 'widget/technician_card.dart';

class AssignTechnicianScreen extends StatefulWidget {
  final Ticket ticket;

  const AssignTechnicianScreen({super.key, required this.ticket});

  @override
  State<AssignTechnicianScreen> createState() => _AssignTechnicianScreenState();
}

class _AssignTechnicianScreenState extends State<AssignTechnicianScreen> {
  User? _selectedTechnician;
  String _searchQuery = '';
  List<User> _allTechnicians = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeDummyTechnicians();
  }

  Future<void> _initializeDummyTechnicians() async {
    final result = await getit<AdminRepo>().getUsersList();
    result.when(
      success: (users) {
        setState(() {
          _allTechnicians = users
              .where((user) => user.role == 'technicien')
              .toList();
        });
      },
      failure: (error) {
        // Handle error appropriately
        if (kDebugMode) {
          print("Error fetching technicians: $error");
        }
      },
    );
  }

  List<User> get _filteredTechnicians {
    if (_searchQuery.isEmpty) {
      return _allTechnicians;
    }
    return _allTechnicians.where((tech) {
      return tech.username.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          tech.email.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Assign Problem',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // Ticket Info Header
          TicketInfoHeader(ticket: widget.ticket),

          const SizedBox(height: 20),

          // Select Technician Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select Technician',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: .1),
                    spreadRadius: 1,
                    blurRadius: 3,
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Find technician...',
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Technicians List
          Expanded(
            child: _filteredTechnicians.isEmpty
                ? Center(
                    child: Text(
                      'No technicians found',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: _filteredTechnicians.length,
                    itemBuilder: (context, index) {
                      final tech = _filteredTechnicians[index];
                      return TechnicianCard(
                        technician: tech,
                        isSelected: _selectedTechnician?.id == tech.id,
                        onTap: () {
                          setState(() {
                            _selectedTechnician = tech;
                          });
                        },
                      );
                    },
                  ),
          ),

          // Confirm Button
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: .2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selectedTechnician == null
                      ? null
                      : () {
                          _confirmAssignment(
                            widget.ticket.id,
                            _selectedTechnician!.id,
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade600,
                    disabledBackgroundColor: Colors.grey.shade300,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Confirm Assignment',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _confirmAssignment(int idTicket, int idTech) {
    if (_selectedTechnician == null) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: Text(
          'Ticket "${widget.ticket.titre}" assigned to ${_selectedTechnician!.username}',
        ),
        actions: [
          TextButton(
            onPressed: () {
              getit<AdminRepo>().assignTicket(idTicket, idTech);
              context.pushNamed(Routes.admin); // Close dialog
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
