import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/players_list.dart';
import 'package:fantabasket_app_flutter/model/stages_list.dart';
import 'package:fantabasket_app_flutter/repositories/stages_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'select_team_event.dart';
part 'select_team_state.dart';

class SelectTeamBloc extends Bloc<SelectTeamEvent, SelectTeamState> {
  final StagesRepository stagesRepository;

  SelectTeamBloc({required this.stagesRepository})
      : super(const TryGetPlayersState()) {
    on<GetPlayersEvent>(_getPlayers);
  }

  void getPlayers() => add(const GetPlayersEvent());

  void result(PlayersList playersList) =>
      emit(ResultGetPlayersState(playersList));

  FutureOr<void> _getPlayers(
    GetPlayersEvent event,
    Emitter<SelectTeamState> emitter,
  ) async {
    emit(const TryGetPlayersState());
    await Future.delayed(const Duration(seconds: 2));
    try {
      final players = await stagesRepository.getPlayers();
      emit(ResultGetPlayersState(players));
    } catch (e) {
      emit(const ErrorGetPlayersState('Giocatori non caricati'));
    }
  }
}
