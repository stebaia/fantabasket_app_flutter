part of 'add_team_bloc.dart';

@immutable
abstract class AddTeamState extends Equatable {
  const AddTeamState();

  @override
  List<Object> get props => [];
}

class InitCreateState extends AddTeamState {
  const InitCreateState();
}

class TryCreateState extends AddTeamState {
  const TryCreateState();
}

class ResultCreateState extends AddTeamState {
  const ResultCreateState();
}

class ErrorCreateState extends AddTeamState {
  final String errorString;

  const ErrorCreateState(this.errorString);
  List<Object> get props => [errorString];
}
