part of 'select_team_bloc.dart';

abstract class SelectTeamEvent extends Equatable {
  const SelectTeamEvent();

  @override
  List<Object> get props => [];
}

class GetPlayersEvent extends SelectTeamEvent {
  const GetPlayersEvent();

  @override
  List<Object> get props => [];
}
