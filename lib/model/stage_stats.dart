import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player_match.dart';

class StageStats extends Equatable {
  final String stageName;
  final int points;
  final List<PlayerMatch> matches;

  const StageStats({
    required this.stageName,
    required this.points,
    required this.matches,
  });

  @override
  List<Object?> get props => [stageName, points, matches];
}
