// lib/features/admin/users_screen.dart

import 'package:flutter/material.dart';
import '../../core/models/user.dart';
import 'ui/widget/user_card.dart';
import 'add_edit_user_screen.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  String _selectedFilter = 'all';
  late List<User> _allUsers;

  @override
  void initState() {
    super.initState();
    _initializeDummyUsers();
  }

  void _initializeDummyUsers() {
    _allUsers = [
      User(id: 1, username: 'Nevisse Admin', email: 'nevisse@company.com', role: 'admin'),
      User(id: 2, username: 'Sarah Jenkins', email: 'sarah@company.com', role: 'employe'),
      User(id: 3, username: 'Michael Chen', email: 'michael@company.com', role: 'employe'),
      User(id: 4, username: 'Emma Wilson', email: 'emma@company.com', role: 'employe'),
      User(id: 10, username: 'David Ross', email: 'david@company.com', role: 'technicien'),
      User(id: 11, username: 'David Chen', email: 'davidc@company.com', role: 'technicien'),
      User(id: 12, username: 'Mika Ross', email: 'mika@company.com', role: 'technicien'),
    ];
  }

  List<User> get _filteredUsers {
    if (_selectedFilter == 'all') {
      return _allUsers;
    } else if (_selectedFilter == 'employe') {
      return _allUsers.where((user) => user.role == 'employe').toList();
    } else if (_selectedFilter == 'technicien') {
      return _allUsers.where((user) => user.role == 'technicien').toList();
    }
    return _allUsers;
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
                      const Icon(Icons.people, size: 28, color: Colors.blue),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Users Management',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.person_add_outlined, color: Colors.grey.shade700),
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddEditUserScreen(),
                            ),
                          );

                          if (result != null && result is User) {
                            setState(() {
                              _allUsers.add(result);
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Total ${_allUsers.length} users',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // Custom Filter Buttons for Users
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  _buildFilterButton('All', 'all'),
                  const SizedBox(width: 8),
                  _buildFilterButton('Employees', 'employe'),
                  const SizedBox(width: 8),
                  _buildFilterButton('Technicians', 'technicien'),
                ],
              ),
            ),

            // Users List
            Expanded(
              child: _filteredUsers.isEmpty
                  ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_off_outlined,
                      size: 80,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No users found',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              )
                  : ListView.builder(
                itemCount: _filteredUsers.length,
                itemBuilder: (context, index) {
                  return UserCard(
                    user: _filteredUsers[index],
                    onEdit: () => _editUser(_filteredUsers[index]),
                    onDelete: () => _deleteUser(_filteredUsers[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String label, String value) {
    final isSelected = _selectedFilter == value;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedFilter = value;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue.shade600 : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? Colors.blue.shade600 : Colors.grey.shade300,
              width: 1,
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey.shade700,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }


  void _editUser(User user) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditUserScreen(user: user),
      ),
    );

    if (result != null && result is User) {
      setState(() {
        final index = _allUsers.indexWhere((u) => u.id == user.id);
        if (index != -1) {
          _allUsers[index] = result;
        }
      });
    }
  }

  void _deleteUser(User user) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete User'),
        content: Text('Are you sure you want to delete ${user.username}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _allUsers.removeWhere((u) => u.id == user.id);
              });
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
