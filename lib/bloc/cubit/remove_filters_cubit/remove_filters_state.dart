part of 'remove_filters_cubit.dart';

abstract class RemoveFiltersState extends Equatable {
  const RemoveFiltersState();

  @override
  List<Object> get props => [];
}

class InitialState extends RemoveFiltersState {
  const InitialState();
}

class ResetState extends RemoveFiltersState {
  const ResetState();
}

class RefusedOperationState extends RemoveFiltersState {
  const RefusedOperationState();
}
