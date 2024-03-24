part of 'view_team_bloc.dart';

sealed class ViewTeamState extends Equatable {
  const ViewTeamState();

  @override
  List<Object> get props => [];
}

final class ViewTeamInitial extends ViewTeamState {}

class TryViewTeamState extends ViewTeamState {
  const TryViewTeamState();
}

class NoTeamsState extends ViewTeamState {
  const NoTeamsState();
}

class ResultViewTeamState extends ViewTeamState {
  final List<Team> myTeams;
  const ResultViewTeamState(this.myTeams);
}

class ErrorViewTeamState extends ViewTeamState {
  final String errorString;

  const ErrorViewTeamState(this.errorString);
  List<Object> get props => [errorString];
}
