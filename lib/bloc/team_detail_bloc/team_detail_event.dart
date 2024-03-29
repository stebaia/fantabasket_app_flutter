part of 'team_detail_bloc.dart';

abstract class TeamDetailEvent extends Equatable {
  const TeamDetailEvent();

  @override
  List<Object> get props => [];
}

class GetTeamDetailEvent extends TeamDetailEvent {
  const GetTeamDetailEvent();

  @override
  List<Object> get props => [];
}

class UpdateDayEvent extends TeamDetailEvent {
  final int dayNumber;
  const UpdateDayEvent(this.dayNumber);

  @override
  List<Object> get props => [];
}
