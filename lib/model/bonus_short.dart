import 'package:equatable/equatable.dart';
import 'package:pair/pair.dart';

class BonusShort extends Equatable {
  final int pointMade;
  final int assist;
  final int block;
  final int bounce;
  final int dunk;
  final int ankleBreaker;
  final int ignorantClothing;

  const BonusShort({
    required this.pointMade,
    required this.assist,
    required this.block,
    required this.bounce,
    required this.dunk,
    required this.ankleBreaker,
    required this.ignorantClothing,
  });

  @override
  List<int> get props => [
        pointMade,
        assist,
        block,
        bounce,
        dunk,
        ankleBreaker,
        ignorantClothing,
      ];
}
