// lib/core/models/user.dart

class User {
  final int id;
  final String username;
  final String email;
  final String? firstName;
  final String? lastName;
  final String role;
  final bool? isActive;
  final String? dateJoined;

  // Constructor
  User({
    required this.id,
    required this.username,
    required this.email,
    required this.role, this.firstName, this.lastName, this.isActive, this.dateJoined,
  });

  // تحويل من JSON إلى User object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      role: json['role'],
      isActive: json['is_active'],
      dateJoined: json['date_joined'],
    );
  }

  // تحويل من User object إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'role': role,
      'is_active': isActive,
      'date_joined': dateJoined,
    };
  }
}