import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player.dart';

class PlayersList extends Equatable {
  final int count;
  final List<Player>? players;

  const PlayersList({required this.count, this.players});

  @override
  List<Object?> get props => [count, players];
}
