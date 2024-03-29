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

  TeamDetailBloc() : super(const InitTeamDetailState()) {
    on<TeamDetailEvent>(_getTeamDetail);
    on<UpdateDayEvent>(_updateDay);
  }

  void updateDay(int dayNumber) => add(UpdateDayEvent(dayNumber));

  void getTeamDetail() => add(const GetTeamDetailEvent());

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
    team = Constants.detailTeamMock;
    currentDay = team.days.last.dayNumber;
    Future.delayed(
        const Duration(seconds: 1), () => emit(ResultTeamDetailState(team)));
    /*
    try {
      var result = await teamRepository.createTeam(
        name: event.name,
        player: event.player,
        cpt: event.cpt,
      );
      if (result.data.code == 1) {
        var finalResult = await teamRepository.addTeamToStage(
          teamId: result.data.team!,
          stageId: event.stage,
        );
        print("pre emit");
        emit(const ResultCreateState());
      } else {
        emit(ErrorCreateState(result.data.message!));
      }
      emit(const InitCreateState());
    } catch (e) {
      emit(const ErrorCreateState("Errore nella creazione della squadra"));
      emit(const InitCreateState());
    }
    */
  }
}
