import 'package:equatable/equatable.dart';
import 'package:pair/pair.dart';

class Bonus extends Equatable {
  final Pair<String, String> pointMade;
  final Pair<String, String> assist;
  final Pair<String, String> block;
  final Pair<String, String> bounce;
  final Pair<String, String> buzzerBeater;
  final Pair<String, String> dunk;
  final Pair<String, String> ankleBreaker;
  final Pair<String, String> postAnd1Exultation;
  final Pair<String, String> pregameRitual;
  final Pair<String, String> teamVictory;
  final Pair<String, String> ignorantClothing;
  final Pair<String, String> speakerKiss;
  final Pair<String, String> victory51;
  final Pair<String, String> mostLoved;

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
  });

  @override
  List<Pair<String, String>> get props => [
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
      ];
}
