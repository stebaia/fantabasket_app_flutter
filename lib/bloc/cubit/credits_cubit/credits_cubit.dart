import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'credits_state.dart';

class CreditsCubit extends Cubit<CreditsState> {
  final BuildContext context;
  int total = 0;
  final max = 65;
  final min = 0;
  CreditsCubit({required this.context}) : super(const InitialState());

  void decrement(int value) async {
    if (total - value >= min) {
      total -= value;
      print("Emit decrement");
      emit(const DecrementState());
    } else {
      emit(const RefusedOperationState());
    }
    emit(const InitialState());
  }

  void increment(int value) async {
    if (total + value <= max) {
      total += value;
      print("Emit increment");
      emit(const IncrementState());
    } else {
      emit(const RefusedOperationState());
    }
    emit(const InitialState());
  }

  int getTotal() => total;

  bool resetTotal() {
    total = 0;
    return true;
  }
}
