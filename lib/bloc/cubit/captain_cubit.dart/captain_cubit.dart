import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'captain_state.dart';

class CaptainCubit extends Cubit<CaptainState> {
  final BuildContext context;
  Player? captain;
  CaptainCubit({required this.context}) : super(const InitialState());

  void selectCaptain(Player newCaptain) async {
    emit(const SelectState());
    captain = newCaptain;
    emit(const InitialState());
  }

  Player? getCaptain() => captain;
}
