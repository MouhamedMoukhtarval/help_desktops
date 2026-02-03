// lib/core/models/ticket.dart

import 'user.dart';

class Ticket {
  final int id;
  final String titre;
  final String description;
  final String priorite;
  final String statut;
  final String dateCreation;
  final String? dateResolution;  // nullable
  final String? pieceJointe;     // nullable
  final User creePar;
  final User? assigneA;          // nullable

  Ticket({
    required this.id,
    required this.titre,
    required this.description,
    required this.priorite,
    required this.statut,
    required this.dateCreation,
    this.dateResolution,
    this.pieceJointe,
    required this.creePar,
    this.assigneA,
  });

  // تحويل من JSON إلى Ticket object
  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'],
      titre: json['titre'],
      description: json['description'],
      priorite: json['priorite'],
      statut: json['statut'],
      dateCreation: json['date_creation'],
      dateResolution: json['date_resolution'],
      pieceJointe: json['piece_jointe'],
      creePar: User.fromJson(json['cree_par']),
      assigneA: json['assigne_a'] != null
          ? User.fromJson(json['assigne_a'])
          : null,
    );
  }

  // تحويل من Ticket object إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titre': titre,
      'description': description,
      'priorite': priorite,
      'statut': statut,
      'date_creation': dateCreation,
      'date_resolution': dateResolution,
      'piece_jointe': pieceJointe,
      'cree_par': creePar.toJson(),
      'assigne_a': assigneA?.toJson(),
    };
  }
}