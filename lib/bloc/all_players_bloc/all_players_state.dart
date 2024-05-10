part of 'all_players_bloc.dart';

@immutable
abstract class AllPlayersState extends Equatable {
  const AllPlayersState();

  @override
  List<Object> get props => [];
}

class TryAllPlayersState extends AllPlayersState {
  const TryAllPlayersState();
}

class EmptyAllPlayersState extends AllPlayersState {
  const EmptyAllPlayersState();
}

class ResultAllPlayersState extends AllPlayersState {
  final PlayersList playersList;
  const ResultAllPlayersState(this.playersList);

  List<Object> get props => [playersList];
}

class ErrorAllPlayersState extends AllPlayersState {
  final String errorString;

  const ErrorAllPlayersState(this.errorString);
  List<Object> get props => [errorString];
}
