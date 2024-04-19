import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player_stage.dart';

class PlayerDetail extends Equatable {
  final String firstName;
  final String lastName;
  final String team;
  final List<PlayerStage> stages;

  const PlayerDetail({
    required this.firstName,
    required this.lastName,
    required this.team,
    required this.stages,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        team,
        stages,
      ];
}
