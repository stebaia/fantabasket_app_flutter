part of 'credits_cubit.dart';

abstract class CreditsState extends Equatable {
  const CreditsState();

  @override
  List<Object> get props => [];
}

class InitialState extends CreditsState {
  const InitialState();
}

class IncrementState extends CreditsState {
  const IncrementState();
}

class DecrementState extends CreditsState {
  const DecrementState();
}

class RefusedOperationState extends CreditsState {
  const RefusedOperationState();
}
