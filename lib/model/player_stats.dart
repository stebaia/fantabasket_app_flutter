import 'package:equatable/equatable.dart';

class PlayerStats extends Equatable {
  final int totalPoints;
  final int totalShots;
  final int threePointers;
  final int missedShots;
  final int freeThrows;

  const PlayerStats({
    required this.totalPoints,
    required this.totalShots,
    required this.threePointers,
    required this.missedShots,
    required this.freeThrows,
  });

  @override
  List<Object?> get props => [
        totalPoints,
        totalShots,
        threePointers,
        missedShots,
        freeThrows,
      ];
}
