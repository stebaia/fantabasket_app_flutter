import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/team_detail.dart';
import 'package:fantabasket_app_flutter/repositories/team_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'team_detail_event.dart';
part 'team_detail_state.dart';

class TeamDetailBloc extends Bloc<TeamDetailEvent, TeamDetailState> {
  late TeamDetail team;
  late String currentDay = "";
  final TeamRepository teamRepository;

  TeamDetailBloc({required this.teamRepository})
      : super(const InitTeamDetailState()) {
    on<TeamDetailEvent>(_getTeamDetail);
    on<UpdateDayEvent>(_updateDay);
  }

  void updateDay(String day) => add(UpdateDayEvent(day));

  void getTeamDetail(int teamId, int stageId) =>
      add(GetTeamDetailEvent(teamId: teamId, stageId: stageId));

  String getCurrentDay() => currentDay;

  FutureOr<void> _updateDay(
    UpdateDayEvent event,
    Emitter<TeamDetailState> emitter,
  ) {
    emit(TryUpdateDayState(team));
    currentDay = event.day;
    Future.delayed(
        const Duration(seconds: 1), () => emit(ResultUpdateDayState(team)));
  }

  FutureOr<void> _getTeamDetail(
    TeamDetailEvent event,
    Emitter<TeamDetailState> emitter,
  ) async {
    emit(const TryTeamDetailState());
    try {
      var e = event as GetTeamDetailEvent;
      var result = await teamRepository.getTeamDetail(e.teamId, e.stageId);
      if (result.response.statusCode == 200) {
        team = result.data;
        for (var a in team.days) {
          var res = a.players.firstWhere((p) => p.reserve);
          a.players.remove(res);
          a.players.add(res);
        }
        if (team.days.isNotEmpty) {
          currentDay = team.days.map((day) => day.day).toList().last;
        }
        emit(ResultTeamDetailState(team));
      } else {
        emit(const ErrorTeamDetailState(
            'Errore nella visualizzazione della squadra'));
      }
      //emit(const InitTeamDetailState());
    } catch (e) {
      emit(const ErrorTeamDetailState(
          "Errore nella visualizzazione della squadra"));
      //emit(const InitTeamDetailState());
    }
  }
}
