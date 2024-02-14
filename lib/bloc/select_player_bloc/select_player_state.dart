part of 'select_player_bloc.dart';

@immutable
abstract class SelectPlayerState extends Equatable {
  const SelectPlayerState();

  @override
  List<Object> get props => [];
}

class InitialPlayerState extends SelectPlayerState {
  final List<Player> players;
  const InitialPlayerState(this.players);

  @override
  List<Player> get props => players;
}

class AddPlayerState extends SelectPlayerState {
  final List<Player> players;
  const AddPlayerState(this.players);

  @override
  List<Player> get props => players;
}

class RemovePlayerState extends SelectPlayerState {
  final List<Player> players;
  const RemovePlayerState(this.players);

  @override
  List<Player> get props => players;
}
