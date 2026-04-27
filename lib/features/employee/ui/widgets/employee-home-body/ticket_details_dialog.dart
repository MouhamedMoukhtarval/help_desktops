import 'package:flutter/material.dart';
import 'package:help_desktops/features/employee/data/models/ticket_employee_response.dart';

class TicketDetailsDialog extends StatelessWidget {
  final TicketDetails details;

  const TicketDetailsDialog({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Row(
        children: [
          const Icon(Icons.confirmation_number, color: Colors.blueAccent),
          const SizedBox(width: 8),
          Text(
            'Ticket #${details.ticket?.id }',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
      
      content: SizedBox(
        width: double.maxFinite, 
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildUserInfoSection(), 
              const Divider(thickness: 1, height: 30),
              _buildCommentsSection(), 
            ],
          ),
        ),
      ),
      
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Ok', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }

  Widget _buildUserInfoSection() {
    return Column(
      children: [
        _buildInfoRow(Icons.person, "Employee", details.ticket?.employee!.username ?? "N/A"),
        const SizedBox(height: 8),
        _buildInfoRow(Icons.email, "Email", details.ticket?.employee!.email ?? "N/A"),
      ],
    );
  }

  Widget _buildCommentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Commantaires",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const SizedBox(height: 10),
        
        if (details.commentaires == null || details.commentaires!.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("No Commantaires", style: TextStyle(color: Colors.grey)),
            ),
          )
        else
          ListView.builder(
            shrinkWrap: true, 
            physics: const NeverScrollableScrollPhysics(), 
            itemCount: details.commentaires!.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Text(
                  details.commentaires![index],
                  style: const TextStyle(fontSize: 14),
                ),
              );
            },
          ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.blueGrey),
        const SizedBox(width: 10),
        Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
        Expanded(
          child: Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }
}