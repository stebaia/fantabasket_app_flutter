import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/model/team.dart';

class TeamList extends Equatable {
  final int count;
  final List<Team>? teams;

  const TeamList({required this.count, this.teams});

  @override
  List<Object?> get props => [count, teams];
}