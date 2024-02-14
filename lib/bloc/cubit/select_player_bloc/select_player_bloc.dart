import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'select_player_state.dart';
part 'select_player_event.dart';

class SelectPlayerBloc extends Bloc<SelectPlayerEvent, SelectPlayerState> {
  final List<Player> checkedPlayers = List.empty(growable: true);

  SelectPlayerBloc() : super(GetPlayersState(List.empty(growable: true))) {
    on<AddPlayerEvent>(_addPlayer);
    on<RemovePlayerEvent>(_removePlayer);
  }

  void addPlayer(Player player) => add(AddPlayerEvent(player));

  void removePlayer(Player player) => add(RemovePlayerEvent(player));

  FutureOr<void> _addPlayer(
    AddPlayerEvent event,
    Emitter<SelectPlayerState> emitter,
  ) async {
    checkedPlayers.add(event.player);
    print("ADD -> Checked players: ${checkedPlayers.length}");
    emit(GetPlayersState(checkedPlayers));
  }

  FutureOr<void> _removePlayer(
    RemovePlayerEvent event,
    Emitter<SelectPlayerState> emitter,
  ) async {
    checkedPlayers.remove(event.player);
    print("REMOVE -> Checked players: ${checkedPlayers.length}");
    emit(GetPlayersState(checkedPlayers));
  }

  List<Player> getCheckedPlayers() {
    return checkedPlayers;
  }
}
