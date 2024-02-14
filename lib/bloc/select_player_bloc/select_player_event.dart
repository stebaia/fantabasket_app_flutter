part of 'select_player_bloc.dart';

abstract class SelectPlayerEvent extends Equatable {
  const SelectPlayerEvent();

  @override
  List<Object> get props => [];
}

class AddPlayerEvent extends SelectPlayerEvent {
  final Player player;
  const AddPlayerEvent(this.player);

  @override
  List<Object> get props => [player];
}

class RemovePlayerEvent extends SelectPlayerEvent {
  final Player player;
  const RemovePlayerEvent(this.player);

  @override
  List<Object> get props => [player];
}
