import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/players_list.dart';
import 'package:fantabasket_app_flutter/repositories/player_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_players_event.dart';
part 'all_players_state.dart';

class AllPlayersBloc extends Bloc<AllPlayersEvent, AllPlayersState> {
  final PlayerRepository playerRepository;

  AllPlayersBloc({required this.playerRepository})
      : super(const TryAllPlayersState()) {
    on<GetAllPlayersEvent>(_getPlayers);
  }

  void getAllPlayers() => add(const GetAllPlayersEvent());

  void result(PlayersList playersList) =>
      emit(ResultAllPlayersState(playersList));

  FutureOr<void> _getPlayers(
    GetAllPlayersEvent event,
    Emitter<AllPlayersState> emitter,
  ) async {
    emit(const TryAllPlayersState());
    try {
      final players = await playerRepository.getAllPlayers();
      emit(ResultAllPlayersState(players.data));
    } catch (e) {
      emit(const ErrorAllPlayersState('Giocatori non caricati'));
    }
  }
}
