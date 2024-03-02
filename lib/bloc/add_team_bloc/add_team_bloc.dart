import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/stages_list.dart';
import 'package:fantabasket_app_flutter/repositories/stages_repository.dart';
import 'package:fantabasket_app_flutter/repositories/team_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_team_event.dart';
part 'add_team_state.dart';

class AddTeamBloc extends Bloc<AddTeamEvent, AddTeamState> {
  final TeamRepository teamRepository;

  AddTeamBloc({required this.teamRepository}) : super(const TryCreateState()) {
    on<AddNewTeamEvent>(_createTeam);
  }

  void addNewTeam({
    required String token,
    required String name,
    required List<int> player,
    required int cpt,
  }) =>
      add(AddNewTeamEvent(
        token: token,
        name: name,
        player: player,
        cpt: cpt,
      ));

  FutureOr<void> _createTeam(
    AddNewTeamEvent event,
    Emitter<AddTeamState> emitter,
  ) async {
    emit(const TryCreateState());
    try {
      final result = await teamRepository.createTeam(
        token: event.token,
        name: event.name,
        player: event.player,
        cpt: event.cpt,
      );
      emit(ResultCreateState());
    } catch (e) {
      emit(const ErrorCreateState('Tappe non caricate'));
    }
  }
}
