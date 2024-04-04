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
  final int ris;
  final int stage;

  const AddNewTeamEvent({
    required this.name,
    required this.player,
    required this.cpt,
    required this.ris,
    required this.stage,
  });

  @override
  List<Object> get props => [];
}
