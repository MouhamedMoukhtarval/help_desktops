// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'ticket_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketResponse _$TicketResponseFromJson(Map<String, dynamic> json) =>
    TicketResponse(
      id: (json['id'] as num?)?.toInt(),
      employee: json['cree_par'] == null
          ? null
          : Employee.fromJson(json['cree_par'] as Map<String, dynamic>),
      technician: json['assigne_a'] == null
          ? null
          : Technician.fromJson(json['assigne_a'] as Map<String, dynamic>),
      title: json['titre'] as String?,
      description: json['description'] as String?,
      priority: json['priorite'] as String?,
      status: json['status'] as String?,
      pieceJointe: json['piece_jointe'] as String?,
      dateCreation: json['date_creation'] as String?,
      dateResolution: json['date_resolution'] as String?,
    );

Map<String, dynamic> _$TicketResponseToJson(TicketResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cree_par': instance.employee,
      'assigne_a': instance.technician,
      'titre': instance.title,
      'description': instance.description,
      'priorite': instance.priority,
      'status': instance.status,
      'piece_jointe': instance.pieceJointe,
      'date_creation': instance.dateCreation,
      'date_resolution': instance.dateResolution,
    };

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
  id: (json['id'] as num?)?.toInt(),
  username: json['username'] as String?,
  email: json['email'] as String?,
  role: json['role'] as String?,
);

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'email': instance.email,
  'role': instance.role,
};

Technician _$TechnicianFromJson(Map<String, dynamic> json) => Technician(
  id: (json['id'] as num?)?.toInt(),
  username: json['username'] as String?,
  email: json['email'] as String?,
  role: json['role'] as String?,
);

Map<String, dynamic> _$TechnicianToJson(Technician instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'role': instance.role,
    };
