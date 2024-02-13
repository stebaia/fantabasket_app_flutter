import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'select_player_state.dart';

class SelectPlayerCubit extends Cubit<SelectPlayerState> {
  final List<Player> checkedPlayers = List.empty(growable: true);

  SelectPlayerCubit() : super(GetPlayersState(List.empty(growable: true)));

  List<Player> getCheckedPlayers() {
    return checkedPlayers;
  }

  void check(Player player) async {
    checkedPlayers.add(player);
    print("CHECK -> Checked players: ${checkedPlayers.length}");
    emit(GetPlayersState(checkedPlayers));
  }

  void uncheck(Player player) async {
    checkedPlayers.remove(player);
    print("UNCHECK -> Checked players: ${checkedPlayers.length}");
    emit(GetPlayersState(checkedPlayers));
  }
}
