import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/match_day.dart';

class TeamDetail extends Equatable {
  final int totalPoints;
  final List<MatchDay> days;

  const TeamDetail({
    required this.totalPoints,
    required this.days,
  });

  @override
  List<Object?> get props => [totalPoints, days];
}
