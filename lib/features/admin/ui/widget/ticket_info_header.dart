// lib/features/admin/ui/widget/ticket_info_header.dart

import 'package:flutter/material.dart';
import '../../data/models/ticket.dart';

class TicketInfoHeader extends StatelessWidget {
  final Ticket ticket;

  const TicketInfoHeader({
    super.key,
    required this.ticket,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: .1),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Priority Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _getPriorityColor(ticket.priorite),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              _getPriorityText(ticket.priorite),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Ticket Title
          Text(
            ticket.titre,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          // Location/Building info (using description for now)
          Row(
            children: [
              Icon(Icons.location_on_outlined,
                size: 16,
                color: Colors.grey.shade600,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  ticket.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getPriorityColor(String priorite) {
    switch (priorite.toLowerCase()) {
      case 'haute':
        return Colors.red.shade400;
      case 'moyenne':
        return Colors.orange.shade400;
      case 'faible':
        return Colors.blue.shade400;
      default:
        return Colors.grey.shade400;
    }
  }

  String _getPriorityText(String priorite) {
    switch (priorite.toLowerCase()) {
      case 'haute':
        return 'HIGH PRIORITY';
      case 'moyenne':
        return 'MEDIUM PRIORITY';
      case 'faible':
        return 'LOW PRIORITY';
      default:
        return priorite.toUpperCase();
    }
  }
}