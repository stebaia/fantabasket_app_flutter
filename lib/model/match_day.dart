import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player.dart';

class MatchDay extends Equatable {
  final int dayNumber;
  final int points;
  final Map<Player, int> players;

  const MatchDay({
    required this.dayNumber,
    required this.points,
    required this.players,
  });

  @override
  List<Object?> get props => [dayNumber, points, players];
}
