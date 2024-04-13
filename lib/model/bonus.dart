import 'package:equatable/equatable.dart';
import 'package:pair/pair.dart';

class Bonus extends Equatable {
  final Pair<String, int> pointMade;
  final Pair<String, int> assist;
  final Pair<String, int> block;
  final Pair<String, int> bounce;
  final Pair<String, int> buzzerBeater;
  final Pair<String, int> dunk;
  final Pair<String, int> ankleBreaker;
  final Pair<String, int> postAnd1Exultation;
  final Pair<String, int> pregameRitual;
  final Pair<String, int> teamVictory;
  final Pair<String, int> ignorantClothing;
  final Pair<String, int> speakerKiss;
  final Pair<String, int> victory51;
  final Pair<String, int> mostLoved;
  final Pair<String, int> total;

  const Bonus({
    required this.pointMade,
    required this.assist,
    required this.block,
    required this.bounce,
    required this.buzzerBeater,
    required this.dunk,
    required this.ankleBreaker,
    required this.postAnd1Exultation,
    required this.pregameRitual,
    required this.teamVictory,
    required this.ignorantClothing,
    required this.speakerKiss,
    required this.victory51,
    required this.mostLoved,
    required this.total,
  });

  @override
  List<Pair<String, int>> get props => [
        pointMade,
        assist,
        block,
        bounce,
        buzzerBeater,
        dunk,
        ankleBreaker,
        postAnd1Exultation,
        pregameRitual,
        teamVictory,
        ignorantClothing,
        speakerKiss,
        victory51,
        mostLoved,
        total,
      ];
}
