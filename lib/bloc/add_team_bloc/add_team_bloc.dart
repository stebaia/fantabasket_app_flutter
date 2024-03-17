import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/repositories/team_repository.dart';
import 'package:fantabasket_app_flutter/services/dto/create_team_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retrofit/retrofit.dart';

part 'add_team_event.dart';
part 'add_team_state.dart';

class AddTeamBloc extends Bloc<AddTeamEvent, AddTeamState> {
  final TeamRepository teamRepository;

  AddTeamBloc({required this.teamRepository}) : super(const InitCreateState()) {
    on<AddNewTeamEvent>(_createTeam);
  }

  void addNewTeam({
    required String name,
    required List<int> player,
    required int cpt,
    required int stage,
  }) =>
      add(AddNewTeamEvent(
        name: name,
        player: player,
        cpt: cpt,
        stage: stage,
      ));

  FutureOr<void> _createTeam(
    AddNewTeamEvent event,
    Emitter<AddTeamState> emitter,
  ) async {
    emit(const TryCreateState());
    try {
      var result = await teamRepository.createTeam(
        name: event.name,
        player: event.player,
        cpt: event.cpt,
      );
      if (result.data.code == 1) {
        var finalResult = await teamRepository.addTeamToStage(
          teamId: result.data.team!,
          stageId: event.stage,
        );
        print("pre emit");
        emit(const ResultCreateState());
      } else {
        emit(ErrorCreateState(result.data.message!));
      }
      emit(const InitCreateState());
    } catch (e) {
      emit(const ErrorCreateState("Errore nella creazione della squadra"));
      emit(const InitCreateState());
    }
  }
}
