part of 'create_team_bloc.dart';

@immutable
abstract class CreateTeamState extends Equatable {
  const CreateTeamState();

  @override
  List<Object> get props => [];
}

class TryGetStagesState extends CreateTeamState {
  const TryGetStagesState();
}

class EmptyGetStagesState extends CreateTeamState {
  const EmptyGetStagesState();
}

class ResultGetStagesState extends CreateTeamState {
  final StagesList stagesList;
  const ResultGetStagesState(this.stagesList);

  List<Object> get props => [stagesList];
}

class ErrorGetStagesState extends CreateTeamState {
  final String errorString;

  const ErrorGetStagesState(this.errorString);
  List<Object> get props => [errorString];
}

class SelectStageState extends CreateTeamState {
  const SelectStageState();
}
