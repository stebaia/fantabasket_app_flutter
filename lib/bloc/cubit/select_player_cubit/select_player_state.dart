part of 'select_player_cubit.dart';

@immutable
abstract class SelectPlayerState extends Equatable {
  const SelectPlayerState();

  @override
  List<Object> get props => [];
}

class GetPlayersState extends SelectPlayerState {
  final List<Player> players;
  const GetPlayersState(this.players);

  @override
  List<Player> get props => [players];
}
