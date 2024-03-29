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

class TryUpdateDayState extends TeamDetailState {
  final TeamDetail teamDetail;
  const TryUpdateDayState(this.teamDetail);
}

class ResultUpdateDayState extends TeamDetailState {
  final TeamDetail teamDetail;
  const ResultUpdateDayState(this.teamDetail);
}

class ResultTeamDetailState extends TeamDetailState {
  final TeamDetail teamDetail;
  const ResultTeamDetailState(this.teamDetail);
}

class ErrorTeamDetailState extends TeamDetailState {
  final String errorString;

  const ErrorTeamDetailState(this.errorString);
  List<Object> get props => [errorString];
}
