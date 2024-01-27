import 'package:equatable/equatable.dart';

class Player extends Equatable {
  final int id;
  final String? firstName;
  final String? lastName;
  final int? value;
  final String? team;
  final String? image;

  const Player(
    this.id,
    this.firstName,
    this.lastName,
    this.value,
    this.team,
    this.image,
  );

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        value,
      ];
}
