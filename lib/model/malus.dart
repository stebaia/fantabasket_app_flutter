import 'package:equatable/equatable.dart';
import 'package:pair/pair.dart';

class Malus extends Equatable {
  final Pair<String, int> airball;
  final Pair<String, int> fouls;
  final Pair<String, int> tacticalFouls;
  final Pair<String, int> teamDefeat;
  final Pair<String, int> reverseClothing;
  final Pair<String, int> worstTeam;
  final Pair<String, int> concededDunk;
  final Pair<String, int> lost51;
  final Pair<String, int> basketConcededBuzzerBeater;
  final Pair<String, int> shaqtinAFool;
  final Pair<String, int> invisibleNumber;
  final Pair<String, int> worstTeamName;
  final Pair<String, int> total;

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
  List<Pair<String, int>> get props => [
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
