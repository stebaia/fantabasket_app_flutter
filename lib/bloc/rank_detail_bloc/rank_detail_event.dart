part of 'rank_detail_bloc.dart';

abstract class RankDetailEvent extends Equatable {
  const RankDetailEvent();

  @override
  List<Object> get props => [];
}

class GetRankingEvent extends RankDetailEvent {
  final int stageId;
  const GetRankingEvent(this.stageId);

  @override
  List<Object> get props => [];
}
