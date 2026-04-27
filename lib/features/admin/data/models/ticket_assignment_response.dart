import 'package:help_desktops/features/admin/data/models/ticket.dart';

class TicketAssignmentResponse {
  final String message;
  final Ticket ticket;

  TicketAssignmentResponse({required this.message, required this.ticket});
  factory TicketAssignmentResponse.fromJson(Map<String, dynamic> json) {
    return TicketAssignmentResponse(
      message: json['message'],
      ticket: Ticket.fromJson(json['ticket']),
    );
  }
}
