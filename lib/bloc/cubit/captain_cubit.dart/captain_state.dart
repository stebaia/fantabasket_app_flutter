part of 'captain_cubit.dart';

abstract class CaptainState extends Equatable {
  const CaptainState();

  @override
  List<Object> get props => [];
}

class InitialState extends CaptainState {
  const InitialState();
}

class SelectState extends CaptainState {
  const SelectState();
}
