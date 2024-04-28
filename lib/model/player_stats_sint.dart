import 'package:equatable/equatable.dart';

class PlayerStatsSint extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String photo;
  final String category;
  final int bonus;
  final int malus;
  final int total;

  const PlayerStatsSint({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.photo,
    required this.category,
    required this.bonus,
    required this.malus,
    required this.total,
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        photo,
        category,
        bonus,
        malus,
        total,
      ];
}
