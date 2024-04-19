part of 'player_detail_bloc.dart';

abstract class PlayerDetailEvent extends Equatable {
  const PlayerDetailEvent();

  @override
  List<Object> get props => [];
}

class GetPlayerDetailEvent extends PlayerDetailEvent {
  final int playerId;

  const GetPlayerDetailEvent(this.playerId);

  @override
  List<Object> get props => [];
}

class UpdateDayEvent extends PlayerDetailEvent {
  final int dayNumber;
  const UpdateDayEvent(this.dayNumber);

  @override
  List<Object> get props => [];
}
