import 'package:flutter/material.dart';
import 'package:help_desktops/features/sign_up/logic/sign_up_cubit.dart';

class ChoixMulitiple extends StatelessWidget {
  final TextEditingController controller;

  const ChoixMulitiple({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: 'Role', 
        prefixIcon: Icon(Icons.badge_outlined),
        border: OutlineInputBorder(),
      ),
      items: SignUpCubit.userRoles.entries.map((entry) {
        return DropdownMenuItem<String>(
          value: entry.value, 
          child: Text(entry.key), 
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          controller.text = value;
        }
      },
      validator: (value) {
        if (controller.text.isEmpty) {
          return 'Please select a role';
        }
        return null;
      },
    );
  }
}