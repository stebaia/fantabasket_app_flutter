part of 'view_team_bloc.dart';

sealed class ViewTeamEvent extends Equatable {
  const ViewTeamEvent();

  @override
  List<Object> get props => [];
}

class ViewMyTeamsEvent extends ViewTeamEvent {
  const ViewMyTeamsEvent();
  @override
  List<Object> get props => [];
}
