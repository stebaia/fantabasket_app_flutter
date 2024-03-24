part of 'rank_detail_bloc.dart';

abstract class RankDetailEvent extends Equatable {
  const RankDetailEvent();

  @override
  List<Object> get props => [];
}

class GetRankingEvent extends RankDetailEvent {
  const GetRankingEvent();

  @override
  List<Object> get props => [];
}
