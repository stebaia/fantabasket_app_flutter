import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player_detail.dart';
import 'package:fantabasket_app_flutter/model/players_stats_list.dart';
import 'package:fantabasket_app_flutter/repositories/player_repository.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'player_detail_event.dart';
part 'player_detail_state.dart';

class PlayerDetailBloc extends Bloc<PlayerDetailEvent, PlayerDetailState> {
  late PlayersStatsList player;
  final PlayerRepository playerRepository;

  PlayerDetailBloc({required this.playerRepository})
      : super(const InitPlayerDetailState()) {
    on<PlayerDetailEvent>(_getPlayerDetail);
  }

  void getPlayerDetail(int playerId) => add(GetPlayerDetailEvent(playerId));

  FutureOr<void> _getPlayerDetail(
    PlayerDetailEvent event,
    Emitter<PlayerDetailState> emitter,
  ) async {
    emit(const TryPlayerDetailState());
    try {
      var e = event as GetPlayerDetailEvent;
      var result = await playerRepository.getPlayerDetails(e.playerId);
      if (result.response.statusCode == 200) {
        player = result.data;
        emit(ResultPlayerDetailState(player));
      } else {
        emit(const ErrorPlayerDetailState(
            'Errore nella visualizzazione del giocatore'));
      }
      //emit(const InitCreateState());
    } catch (e) {
      emit(const ErrorPlayerDetailState(
          "Errore nella visualizzazione del giocatore"));
      //emit(const InitCreateState());
    }
  }
}
