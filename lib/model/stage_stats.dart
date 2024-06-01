import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player_match.dart';

class StageStats extends Equatable {
  final String stageName;
  final int points;
  final String? name;
  final String? surname;
  final String? photo;
  final String? category;
  final String? team;
  final List<PlayerMatch> matches;

  const StageStats({
    required this.stageName,
    required this.points,
    required this.matches,
    required this.name,
    required this.surname,
    required this.category,
    required this.photo,
    required this.team,
  });

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
      ];
}
