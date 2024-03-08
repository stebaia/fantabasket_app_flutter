part of 'add_team_bloc.dart';

abstract class AddTeamEvent extends Equatable {
  const AddTeamEvent();

  @override
  List<Object> get props => [];
}

class AddNewTeamEvent extends AddTeamEvent {
  final String name;
  final List<int> player;
  final int cpt;

  const AddNewTeamEvent({
    required this.name,
    required this.player,
    required this.cpt,
  });

  @override
  List<Object> get props => [];
}
