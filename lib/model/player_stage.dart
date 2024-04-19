import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player_match.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';

class PlayerStage extends Equatable {
  final Stage stage;
  final List<PlayerMatch> matches;

  const PlayerStage({
    required this.stage,
    required this.matches,
  });

  @override
  List<Object?> get props => [
        stage,
        matches,
      ];
}
