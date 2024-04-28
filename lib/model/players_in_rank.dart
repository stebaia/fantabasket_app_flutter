import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player_in_rank.dart';

class PlayersInRank extends Equatable {
  final int count;
  final List<PlayerInRank>? teams;

  const PlayersInRank({required this.count, this.teams});

  @override
  List<Object?> get props => [count, teams];
}
