import 'package:json_annotation/json_annotation.dart';

part 'ticket_employee_response.g.dart';

@JsonSerializable()
class TicketEmployeeResponse {
  int? id;
  @JsonKey(name: 'cree_par')
  Employee? employee;
  @JsonKey(name: 'assigne_a')
  Technician? technician;
  @JsonKey(name: 'titre')
  String? title;
  String? description;
  @JsonKey(name: 'priorite')
  String? priority;
  @JsonKey(name: 'statut')
  String? status;
  @JsonKey(name: 'piece_jointe')
  String? pieceJointe;
  @JsonKey(name: 'date_creation')
  String? dateCreation;
  @JsonKey(name: 'date_resolution')
  String? dateResolution;

  TicketEmployeeResponse({
    this.id,
    this.employee,
    this.technician,
    this.title,
    this.description,
    this.priority,
    this.status,
    this.pieceJointe,
    this.dateCreation,
    this.dateResolution,
  });
  factory TicketEmployeeResponse.fromJson(Map<String, dynamic> json) => _$TicketEmployeeResponseFromJson(json);
}
// @JsonSerializable()
// class TicketStartWorkResponse {
//   String ? message;
//   @JsonKey(name: 'ticket')
//   TicketEmployeeResponse ? ticketSWR;
//   TicketStartWorkResponse({this.message, this.ticketSWR});
//   factory TicketStartWorkResponse.fromJson(Map<String, dynamic> json) =>
//       _$TicketStartWorkResponseFromJson(json);
// }

@JsonSerializable()
class Employee {
  int? id;
  String? username;
  String? email;
  String? role;
  Employee({this.id, this.username, this.email, this.role});
  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
}
@JsonSerializable()
class TicketDetails{
  @JsonKey(name : 'ticket')
  TicketEmployeeResponse? ticket;
  List<String>? commentaires;
  TicketDetails({this.ticket, this.commentaires});
  factory TicketDetails.fromJson(Map<String, dynamic> json) => _$TicketDetailsFromJson(json);
}

@JsonSerializable()
class Technician {
  int? id;
  String? username;
  String? email;
  String? role;
  Technician({this.id, this.username, this.email, this.role});
  factory Technician.fromJson(Map<String, dynamic> json) =>
      _$TechnicianFromJson(json);
}



