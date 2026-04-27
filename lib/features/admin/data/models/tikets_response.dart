import 'package:help_desktops/features/admin/data/models/ticket.dart';

class TiketsResponse {
  final List<Ticket> tickets;

  TiketsResponse({required this.tickets});

  factory TiketsResponse.fromJson(Map<String, dynamic> json) {
    var list = json['tickets'] as List;
    List<Ticket> ticketsList = list.map((i) => Ticket.fromJson(i)).toList();
    return TiketsResponse(tickets: ticketsList);
  }
}