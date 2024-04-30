import 'package:equatable/equatable.dart';
import 'package:pair/pair.dart';

class Malus extends Equatable {
  final Pair<String, String> airball;
  final Pair<String, String> fouls;
  final Pair<String, String> tacticalFouls;
  final Pair<String, String> teamDefeat;
  final Pair<String, String> reverseClothing;
  final Pair<String, String> worstTeam;
  final Pair<String, String> concededDunk;
  final Pair<String, String> lost51;
  final Pair<String, String> basketConcededBuzzerBeater;
  final Pair<String, String> shaqtinAFool;
  final Pair<String, String> invisibleNumber;
  final Pair<String, String> worstTeamName;

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
  });

  @override
  List<Pair<String, String>> get props => [
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
      ];
}
