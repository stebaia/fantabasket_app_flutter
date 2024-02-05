import 'package:equatable/equatable.dart';

class Player extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String category;
  final String team;
  final int value;

  const Player(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.value,
      required this.team,
      required this.phone,
      required this.category,
      required this.email});

  @override
  List<Object?> get props =>
      [id, firstName, lastName, value, team, phone, category, email];
}
