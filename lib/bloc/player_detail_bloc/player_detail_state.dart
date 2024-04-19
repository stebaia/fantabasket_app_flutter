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

class TryUpdateDayState extends PlayerDetailState {
  final PlayerDetail playerDetail;
  const TryUpdateDayState(this.playerDetail);
}

class ResultUpdateDayState extends PlayerDetailState {
  final PlayerDetail playerDetail;
  const ResultUpdateDayState(this.playerDetail);
}

class ResultPlayerDetailState extends PlayerDetailState {
  final PlayerDetail playerDetail;
  const ResultPlayerDetailState(this.playerDetail);
}

class ErrorPlayerDetailState extends PlayerDetailState {
  final String errorString;

  const ErrorPlayerDetailState(this.errorString);
  List<Object> get props => [errorString];
}
