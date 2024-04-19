import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player_detail.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'player_detail_event.dart';
part 'player_detail_state.dart';

class PlayerDetailBloc extends Bloc<PlayerDetailEvent, PlayerDetailState> {
  late PlayerDetail player;
  late int currentDay = 0;

  PlayerDetailBloc() : super(const InitPlayerDetailState()) {
    on<PlayerDetailEvent>(_getPlayerDetail);
    on<UpdateDayEvent>(_updateDay);
  }

  void updateDay(int dayNumber) => add(UpdateDayEvent(dayNumber));

  void getPlayerDetail(int playerId) => add(GetPlayerDetailEvent(playerId));

  int getCurrentDay() => currentDay;

  FutureOr<void> _updateDay(
    UpdateDayEvent event,
    Emitter<PlayerDetailState> emitter,
  ) {
    emit(TryUpdateDayState(player));
    currentDay = event.dayNumber;
    Future.delayed(
        const Duration(seconds: 1), () => emit(ResultUpdateDayState(player)));
  }

  FutureOr<void> _getPlayerDetail(
    PlayerDetailEvent event,
    Emitter<PlayerDetailState> emitter,
  ) async {
    emit(const TryPlayerDetailState());
    player = Constants.playerDetailMock;
    Future.delayed(const Duration(seconds: 1),
        () => emit(ResultPlayerDetailState(player)));
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
