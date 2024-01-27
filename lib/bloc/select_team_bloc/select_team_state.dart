part of 'select_team_bloc.dart';

@immutable
abstract class SelectTeamState extends Equatable {
  const SelectTeamState();

  @override
  List<Object> get props => [];
}

class TryGetPlayersState extends SelectTeamState {
  const TryGetPlayersState();
}

class EmptyGetPlayersState extends SelectTeamState {
  const EmptyGetPlayersState();
}

class ResultGetPlayersState extends SelectTeamState {
  final PlayersList playersList;
  const ResultGetPlayersState(this.playersList);

  List<Object> get props => [playersList];
}

class ErrorGetPlayersState extends SelectTeamState {
  final String errorString;

  const ErrorGetPlayersState(this.errorString);
  List<Object> get props => [errorString];
}
