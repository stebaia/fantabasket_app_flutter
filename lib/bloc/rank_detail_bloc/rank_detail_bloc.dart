import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player_in_rank.dart';
import 'package:fantabasket_app_flutter/model/players_in_rank.dart';
import 'package:fantabasket_app_flutter/repositories/team_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rank_detail_state.dart';
part 'rank_detail_event.dart';

class RankDetailBloc extends Bloc<RankDetailEvent, RankDetailState> {
  final TeamRepository teamRepository;

  RankDetailBloc({required this.teamRepository}) : super(ViewTeamInitial()) {
    on<GetRankingEvent>(_getRanking);
  }

  void getRanking(int stageId) => add(GetRankingEvent(stageId));

  FutureOr<void> _getRanking(
      GetRankingEvent event, Emitter<RankDetailState> emitter) async {
    emit(const TryGetRanking());
    try {
      var result = await teamRepository.getTeamsRanked(event.stageId);
      if (result.response.statusCode == 200) {
        if (result.data != null) {
          var list = result.data.teams;
          if (list != null) {
            list.sort(((b, a) => a.points!.compareTo(b.points!)));
          }
          emit(ResultRankingState(result.data));
        } else {
          emit(const NoRankingState());
        }
      } else {
        emit(
            const ErrorRankingState('Errore nello scaricamento delle squadre'));
      }
    } catch (e) {
      emit(ErrorRankingState(e.toString()));
    }
  }
}
