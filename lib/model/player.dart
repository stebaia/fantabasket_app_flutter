import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/bonus.dart';
import 'package:fantabasket_app_flutter/model/bonus_short.dart';

class Player extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String photo;
  final String phone;
  final String category;
  final String team;
  final int value;
  final BonusShort? points;

  const Player({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.value,
    required this.team,
    required this.photo,
    required this.phone,
    required this.category,
    required this.email,
    required this.points,
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        value,
        team,
        photo,
        phone,
        category,
        email,
        points,
      ];
}
