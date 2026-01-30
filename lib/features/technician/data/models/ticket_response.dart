import 'package:json_annotation/json_annotation.dart';

part 'ticket_response.g.dart';

@JsonSerializable()
class Ticket {
  int? id;
  @JsonKey(name: 'cree_par')
  Employee? employee;
  @JsonKey(name: 'assigne_a')
  Technician? technician;
  String? title;
  String? description;
  @JsonKey(name: 'priorite')
  String? priority;
  String? status;
  @JsonKey(name: 'piece_jointe')
  String? pieceJointe;
  @JsonKey(name: 'date_creation')
  String? dateCreation;
  @JsonKey(name: 'date_resolution')
  String? dateResolution;

  Ticket({
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
  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
}

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
class Technician {
  int? id;
  String? username;
  String? email;
  String? role;
  Technician({this.id, this.username, this.email, this.role});
  factory Technician.fromJson(Map<String, dynamic> json) =>
      _$TechnicianFromJson(json);
}
