import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player_in_rank.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rank_detail_state.dart';
part 'rank_detail_event.dart';

class RankDetailBloc extends Bloc<RankDetailEvent, RankDetailState> {
  RankDetailBloc() : super(ViewTeamInitial()) {
    on<GetRankingEvent>(_getRanking);
  }

  void getRanking() => add(const GetRankingEvent());

  FutureOr<void> _getRanking(
      GetRankingEvent event, Emitter<RankDetailState> emitter) async {
    emit(const TryGetRanking());
    var ranking = Constants.rankDetailMock;
    Future.delayed(
        const Duration(seconds: 1), () => emit(ResultRankingState(ranking)));
    /*
    try {
      var result = await teamRepository.getTeams();
      if (result.response.statusCode == 200) {
        if (result.data.teams != null) {
          emit(ResultViewTeamState(result.data.teams!));
        } else {
          emit(const NoTeamsState());
        }
      } else {
        emit(const ErrorViewTeamState(
            'Errore nello scaricamento delle squadre'));
      }
    } catch (e) {
      emit(ErrorViewTeamState(e.toString()));
    }
    */
  }
}
