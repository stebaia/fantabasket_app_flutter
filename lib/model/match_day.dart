import 'package:equatable/equatable.dart';

class MatchDay extends Equatable {
  final int dayNumber;
  final int points;

  const MatchDay({
    required this.dayNumber,
    required this.points,
  });

  @override
  List<Object?> get props => [dayNumber, points];
}
