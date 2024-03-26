import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/match_day.dart';
import 'package:fantabasket_app_flutter/model/player.dart';

class TeamDetail extends Equatable {
  final int totalPoints;
  final Map<Player, int> players;
  final List<MatchDay> days;

  const TeamDetail({
    required this.totalPoints,
    required this.players,
    required this.days,
  });

  @override
  List<Object?> get props => [totalPoints, players, days];
}
