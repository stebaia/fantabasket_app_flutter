import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/players_list.dart';
import 'package:fantabasket_app_flutter/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'select_player_state.dart';

class SelectPlayerCubit extends Cubit<SelectPlayerState> {
  final List<Player> players;
  final List<Player> checkedPlayers = List.empty(growable: true);
  final BuildContext context;

  SelectPlayerCubit({
    required this.players,
    required this.context,
  }) : super(GetPlayersState(List.empty(growable: true)));

  void check(Player player) async {
    checkedPlayers.add(player);
    players.remove(player);
    emit(GetPlayersState(checkedPlayers));
  }

  void uncheck(Player player) async {
    players.add(player);
    checkedPlayers.remove(player);
    emit(GetPlayersState(checkedPlayers));
  }
}
