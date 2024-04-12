import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player_stats.dart';

class PlayerMatch extends Equatable {
  final int dayNumber;
  final PlayerStats stats;

  const PlayerMatch({
    required this.dayNumber,
    required this.stats,
  });

  @override
  List<Object?> get props => [
        dayNumber,
        stats,
      ];
}
