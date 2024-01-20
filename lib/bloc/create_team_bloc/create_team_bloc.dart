import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/stages_list.dart';
import 'package:fantabasket_app_flutter/repositories/stages_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_team_event.dart';
part 'create_team_state.dart';

class CreateTeamBloc extends Bloc<CreateTeamEvent, CreateTeamState> {
  final StagesRepository stagesRepository;

  CreateTeamBloc({required this.stagesRepository})
      : super(const TryGetStagesState()) {
    on<GetStagesEvent>(_getStages);
  }

  void getStages() => add(const GetStagesEvent());

  void result(StagesList stagesList) => emit(ResultGetStagesState(stagesList));

  FutureOr<void> _getStages(
    GetStagesEvent event,
    Emitter<CreateTeamState> emitter,
  ) async {
    emit(const TryGetStagesState());
    await Future.delayed(const Duration(seconds: 2));
    try {
      final stages = await stagesRepository.getStages();
      emit(ResultGetStagesState(stages));
    } catch (e) {
      emit(const ErrorGetStagesState('Tappe non caricate'));
    }
  }
}
