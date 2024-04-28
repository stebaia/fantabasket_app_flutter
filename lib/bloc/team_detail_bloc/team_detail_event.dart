part of 'team_detail_bloc.dart';

abstract class TeamDetailEvent extends Equatable {
  const TeamDetailEvent();

  @override
  List<Object> get props => [];
}

class GetTeamDetailEvent extends TeamDetailEvent {
  final int teamId;
  const GetTeamDetailEvent({required this.teamId});

  @override
  List<Object> get props => [];
}

class UpdateDayEvent extends TeamDetailEvent {
  final String day;
  const UpdateDayEvent(this.day);

  @override
  List<Object> get props => [];
}
