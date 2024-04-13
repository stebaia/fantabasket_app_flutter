import 'package:equatable/equatable.dart';

class Malus extends Equatable {
  final int airball;
  final int fouls;
  final int tacticalFouls;
  final int teamDefeat;
  final int reverseClothing;
  final int worstTeam;
  final int concededDunk;
  final int lost51;
  final int basketConcededBuzzerBeater;
  final int shaqtinAFool;
  final int invisibleNumber;
  final int worstTeamName;
  final int total;

  const Malus({
    required this.airball,
    required this.fouls,
    required this.tacticalFouls,
    required this.teamDefeat,
    required this.reverseClothing,
    required this.worstTeam,
    required this.concededDunk,
    required this.lost51,
    required this.basketConcededBuzzerBeater,
    required this.shaqtinAFool,
    required this.invisibleNumber,
    required this.worstTeamName,
    required this.total,
  });

  @override
  List<Object?> get props => [
        airball,
        fouls,
        tacticalFouls,
        teamDefeat,
        reverseClothing,
        worstTeam,
        concededDunk,
        lost51,
        basketConcededBuzzerBeater,
        shaqtinAFool,
        invisibleNumber,
        worstTeamName,
        total,
      ];
}
