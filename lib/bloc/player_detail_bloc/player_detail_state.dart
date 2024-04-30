part of 'player_detail_bloc.dart';

@immutable
abstract class PlayerDetailState extends Equatable {
  const PlayerDetailState();

  @override
  List<Object> get props => [];
}

class InitPlayerDetailState extends PlayerDetailState {
  const InitPlayerDetailState();
}

class TryPlayerDetailState extends PlayerDetailState {
  const TryPlayerDetailState();
}

class ResultPlayerDetailState extends PlayerDetailState {
  final PlayersStatsList playerStatsList;
  const ResultPlayerDetailState(this.playerStatsList);
}

class ErrorPlayerDetailState extends PlayerDetailState {
  final String errorString;

  const ErrorPlayerDetailState(this.errorString);
  List<Object> get props => [errorString];
}
