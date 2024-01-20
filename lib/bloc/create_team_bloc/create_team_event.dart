part of 'create_team_bloc.dart';

abstract class CreateTeamEvent extends Equatable {
  const CreateTeamEvent();

  @override
  List<Object> get props => [];
}

class GetStagesEvent extends CreateTeamEvent {
  const GetStagesEvent();

  @override
  List<Object> get props => [];
}
