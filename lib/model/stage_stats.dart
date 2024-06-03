import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player_match.dart';
import 'package:fantabasket_app_flutter/model/player_stats.dart';

class StageStats extends Equatable {
  final String stageName;
  final int points;
  final String? name;
  final String? surname;
  final String? photo;
  final String? category;
  final String? team;
  final List<PlayerMatch> matches;
  final PlayerStats playerStats;

  const StageStats(
      {required this.stageName,
      required this.points,
      required this.matches,
      required this.name,
      required this.surname,
      required this.category,
      required this.photo,
      required this.team,
      required this.playerStats});

  @override
  List<Object?> get props => [
        stageName,
        points,
        matches,
        name,
        surname,
        category,
        photo,
        team,
        playerStats
      ];
}
