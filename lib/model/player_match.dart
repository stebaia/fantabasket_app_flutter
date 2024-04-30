import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/bonus.dart';
import 'package:fantabasket_app_flutter/model/malus.dart';

class PlayerMatch extends Equatable {
  final String day;
  final int points;
  final Bonus? bonus;
  final Malus? malus;

  const PlayerMatch({
    required this.day,
    required this.points,
    required this.bonus,
    required this.malus,
  });

  @override
  List<Object?> get props => [day, points, bonus, malus];
}
