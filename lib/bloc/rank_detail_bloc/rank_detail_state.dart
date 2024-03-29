part of 'rank_detail_bloc.dart';

sealed class RankDetailState extends Equatable {
  const RankDetailState();

  @override
  List<Object> get props => [];
}

final class ViewTeamInitial extends RankDetailState {}

class TryGetRanking extends RankDetailState {
  const TryGetRanking();
}

class NoRankingState extends RankDetailState {
  const NoRankingState();
}

class ResultRankingState extends RankDetailState {
  final List<PlayerInRank> players;
  const ResultRankingState(this.players);
}

class ErrorRankingState extends RankDetailState {
  final String errorString;

  const ErrorRankingState(this.errorString);
  List<Object> get props => [errorString];
}
