import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/team_detail.dart';
import 'package:fantabasket_app_flutter/repositories/team_repository.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'team_detail_event.dart';
part 'team_detail_state.dart';

class TeamDetailBloc extends Bloc<TeamDetailEvent, TeamDetailState> {
  late TeamDetail team;
  late int currentDay = 0;
  final TeamRepository teamRepository;

  TeamDetailBloc({required this.teamRepository})
      : super(const InitTeamDetailState()) {
    on<TeamDetailEvent>(_getTeamDetail);
    on<UpdateDayEvent>(_updateDay);
  }

  void updateDay(int dayNumber) => add(UpdateDayEvent(dayNumber));

  void getTeamDetail(int teamId) => add(GetTeamDetailEvent(teamId: teamId));

  int getCurrentDay() => currentDay;

  FutureOr<void> _updateDay(
    UpdateDayEvent event,
    Emitter<TeamDetailState> emitter,
  ) {
    emit(TryUpdateDayState(team));
    currentDay = event.dayNumber;
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
      var result = await teamRepository.getTeamDetail(e.teamId);
      if (result.response.statusCode == 200) {
        emit(ResultTeamDetailState(result.data));
      } else {
        emit(const ErrorTeamDetailState(
            'Errore nello scaricamento della squadra'));
      }
      //emit(const InitTeamDetailState());
    } catch (e) {
      emit(const ErrorTeamDetailState("Errore nella creazione della squadra"));
      //emit(const InitTeamDetailState());
    }
  }
}
