import 'package:equatable/equatable.dart';

class Bonus extends Equatable {
  final int pointMade;
  final int assist;
  final int block;
  final int bounce;
  final int buzzerBeater;
  final int dunk;
  final int ankleBreaker;
  final int postAnd1Exultation;
  final int pregameRitual;
  final int teamVictory;
  final int ignorantClothing;
  final int speakerKiss;
  final int victory51;
  final int mostLoved;
  final int total;

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
  List<Object?> get props => [
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
