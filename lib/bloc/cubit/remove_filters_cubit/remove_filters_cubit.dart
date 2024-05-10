import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'remove_filters_state.dart';

class RemoveFiltersCubit extends Cubit<RemoveFiltersState> {
  final BuildContext context;
  RemoveFiltersCubit({required this.context}) : super(const InitialState());

  void reset() async {
    emit(const ResetState());
    emit(const InitialState());
  }
}
