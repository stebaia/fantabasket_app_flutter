import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/players_list.dart';
import 'package:fantabasket_app_flutter/model/stages_list.dart';
import 'package:fantabasket_app_flutter/repositories/player_repository.dart';
import 'package:fantabasket_app_flutter/repositories/stages_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'select_team_event.dart';
part 'select_team_state.dart';

class SelectTeamBloc extends Bloc<SelectTeamEvent, SelectTeamState> {
  final StagesRepository stagesRepository;
  final PlayerRepository playerRepository;

  SelectTeamBloc(
      {required this.stagesRepository, required this.playerRepository})
      : super(const TryGetPlayersState()) {
    on<GetPlayersEvent>(_getPlayers);
  }

  void getPlayers(int stage) => add(GetPlayersEvent(stage));

  void result(PlayersList playersList) =>
      emit(ResultGetPlayersState(playersList));

  FutureOr<void> _getPlayers(
    GetPlayersEvent event,
    Emitter<SelectTeamState> emitter,
  ) async {
    emit(const TryGetPlayersState());

    try {
      final players = await playerRepository.getPlayers(event.stage);
      print("BUFE W: ${players.response.statusCode}");
      if (players.response.statusCode == 200) {
        emit(ResultGetPlayersState(players.data));
      } else {
        emit(const ErrorGetPlayersState('Giocatori non caricati'));
      }
    } catch (e) {
      print("IN ERROR");
      emit(const ErrorGetPlayersState('Errore nel caricamento dei giocatori'));
    }
  }
}
