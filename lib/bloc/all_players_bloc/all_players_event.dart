part of 'all_players_bloc.dart';

abstract class AllPlayersEvent extends Equatable {
  const AllPlayersEvent();

  @override
  List<Object> get props => [];
}

class GetAllPlayersEvent extends AllPlayersEvent {
  const GetAllPlayersEvent();

  @override
  List<Object> get props => [];
}
