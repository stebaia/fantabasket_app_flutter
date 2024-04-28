import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player_stats_sint.dart';

class MatchDay extends Equatable {
  final int day;
  final int points;
  final List<PlayerStatsSint> players;

  const MatchDay({
    required this.day,
    required this.points,
    required this.players,
  });

  @override
  List<Object?> get props => [day, points, players];
}
