import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/team.dart';
import 'package:fantabasket_app_flutter/repositories/team_repository.dart';

part 'view_team_event.dart';
part 'view_team_state.dart';

class ViewTeamBloc extends Bloc<ViewTeamEvent, ViewTeamState> {
  final TeamRepository teamRepository;

  ViewTeamBloc({required this.teamRepository}) : super(ViewTeamInitial()) {
    on<ViewMyTeamsEvent>(_viewMyTeams);
  }

  void viewMyTeams() => add(const ViewMyTeamsEvent());

  FutureOr<void> _viewMyTeams(
      ViewMyTeamsEvent event, Emitter<ViewTeamState> emitter) async {
    emit(const TryViewTeamState());
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
  }
}
