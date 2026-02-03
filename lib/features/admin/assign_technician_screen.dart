// lib/features/admin/assign_technician_screen.dart

import 'package:flutter/material.dart';
import '../../core/models/ticket.dart';
import '../../core/models/user.dart';
import 'ui/widget/ticket_info_header.dart';
import 'ui/widget/technician_card.dart';

class AssignTechnicianScreen extends StatefulWidget {
  final Ticket ticket;

  const AssignTechnicianScreen({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  @override
  State<AssignTechnicianScreen> createState() => _AssignTechnicianScreenState();
}

class _AssignTechnicianScreenState extends State<AssignTechnicianScreen> {
  User? _selectedTechnician;
  String _searchQuery = '';
  late List<User> _allTechnicians;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeDummyTechnicians();
  }

  void _initializeDummyTechnicians() {
    _allTechnicians = [
      User(
        id: 10,
        username: 'Sarah Jenkins',
        email: 'sarah.j@company.com',
        role: 'technicien',
      ),
      User(
        id: 11,
        username: 'David Chen',
        email: 'david.c@company.com',
        role: 'technicien',
      ),
      User(
        id: 12,
        username: 'Mika Ross',
        email: 'mika.r@company.com',
        role: 'technicien',
      ),
    ];
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
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
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
                    color: Colors.grey.withOpacity(0.1),
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
                  color: Colors.grey.withOpacity(0.2),
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
                    _confirmAssignment();
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
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _confirmAssignment() {
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
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back to dashboard
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}