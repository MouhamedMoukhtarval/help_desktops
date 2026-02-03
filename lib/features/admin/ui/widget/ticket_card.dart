// lib/features/admin/ui/widget/ticket_card.dart

import 'package:flutter/material.dart';
import '../../../../core/models/ticket.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;
  final VoidCallback onAssignTap;

  const TicketCard({
    Key? key,
    required this.ticket,
    required this.onAssignTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: User info + Status
          Row(
            children: [
              // User Avatar
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue.shade100,
                child: Text(
                  ticket.creePar.username[0].toUpperCase(),
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // User name and time
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ticket.creePar.username,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      _formatDate(ticket.dateCreation),
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              // Status Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: _getStatusColor(ticket.statut),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _getStatusText(ticket.statut),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Ticket Title
          Text(
            ticket.titre,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 6),

          // Ticket Description
          Text(
            ticket.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 12),

          // Assign Button or Assigned Info
          ticket.assigneA == null
              ? SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onAssignTap,
              icon: const Icon(Icons.person_add, size: 18),
              label: const Text('Assign Technician'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade600,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          )
              : Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green.shade600, size: 18),
                const SizedBox(width: 8),
                Text(
                  'Assigned to ${ticket.assigneA!.username}',
                  style: TextStyle(
                    color: Colors.green.shade700,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper: Format date
  String _formatDate(String dateString) {
    try {
      DateTime date = DateTime.parse(dateString);
      DateTime now = DateTime.now();

      if (date.year == now.year && date.month == now.month && date.day == now.day) {
        return 'Today ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
      } else {
        return '${date.day}/${date.month} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
      }
    } catch (e) {
      return dateString;
    }
  }

  // Helper: Get status color
  Color _getStatusColor(String statut) {
    switch (statut.toLowerCase()) {
      case 'nouveau':
        return Colors.red.shade400;
      case 'en_cours':
        return Colors.blue.shade400;
      case 'resolu':
        return Colors.green.shade400;
      case 'ferme':
        return Colors.grey.shade400;
      default:
        return Colors.grey.shade400;
    }
  }

  // Helper: Get status text
  String _getStatusText(String statut) {
    switch (statut.toLowerCase()) {
      case 'nouveau':
        return 'PENDING';
      case 'en_cours':
        return 'IN PROGRESS';
      case 'resolu':
        return 'RESOLVED';
      case 'ferme':
        return 'CLOSED';
      default:
        return statut.toUpperCase();
    }
  }
}