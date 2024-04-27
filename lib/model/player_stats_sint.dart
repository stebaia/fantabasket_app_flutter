import 'package:equatable/equatable.dart';

class PlayerStatsSint extends Equatable {
  final String firstName;
  final String lastName;
  final String photo;
  final int bonus;
  final int malus;
  final int total;

  const PlayerStatsSint({
    required this.firstName,
    required this.lastName,
    required this.photo,
    required this.bonus,
    required this.malus,
    required this.total,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        photo,
        bonus,
        malus,
        total,
      ];
}
