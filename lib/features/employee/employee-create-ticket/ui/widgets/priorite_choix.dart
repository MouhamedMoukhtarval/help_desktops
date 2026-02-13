import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:help_desktops/features/employee/employee-create-ticket/logic/employee_create_ticket_cubit.dart';

class PrioriteChoix extends StatelessWidget {
  final TextEditingController prioriteController ;
  const PrioriteChoix({super.key, required this.prioriteController});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: 'Priority',
        prefixIcon: Icon(Icons.warning_amber),
        border: OutlineInputBorder(),
      ),
      items: EmployeeCreateTicketCubit.priorities.entries.map((entry) {
        return DropdownMenuItem<String>(
          value: entry.value,
          child: Text(entry.key)
        );
      }).toList(),
      onChanged: (value){
        if(value != null){
          prioriteController.text = value;
        }
      },
      validator: (value){
        if(prioriteController.text.isEmpty){
          return 'Choice a priority please';
        }
        return null;
      },
    );
  }
}