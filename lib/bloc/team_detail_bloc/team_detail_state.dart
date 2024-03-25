part of 'team_detail_bloc.dart';

@immutable
abstract class TeamDetailState extends Equatable {
  const TeamDetailState();

  @override
  List<Object> get props => [];
}

class InitTeamDetailState extends TeamDetailState {
  const InitTeamDetailState();
}

class TryTeamDetailState extends TeamDetailState {
  const TryTeamDetailState();
}

class ResultTeamDetailState extends TeamDetailState {
  final List<Player> players;
  const ResultTeamDetailState(this.players);
}

class ErrorTeamDetailState extends TeamDetailState {
  final String errorString;

  const ErrorTeamDetailState(this.errorString);
  List<Object> get props => [errorString];
}
