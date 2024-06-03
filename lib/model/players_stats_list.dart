import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player_match.dart';
import 'package:fantabasket_app_flutter/model/player_stats.dart';
import 'package:fantabasket_app_flutter/model/stage_stats.dart';

class PlayersStatsList extends Equatable {
  final int count;
  final List<StageStats>? stages;

  const PlayersStatsList({
    required this.count,
    this.stages,
  });

  @override
  List<Object?> get props => [count, stages];
}
