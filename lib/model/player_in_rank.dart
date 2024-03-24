import 'package:equatable/equatable.dart';

class PlayerInRank extends Equatable {
  final String firstName;
  final String lastName;
  final String teamName;
  final int points;
  final int position;

  const PlayerInRank({
    required this.firstName,
    required this.lastName,
    required this.teamName,
    required this.points,
    required this.position,
  });

  @override
  List<Object?> get props => [firstName, lastName, teamName, points, position];
}
