import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sixth_man_state.dart';

class SixthManCubit extends Cubit<SixthManState> {
  final BuildContext context;
  Player? sixthMan;
  SixthManCubit({required this.context}) : super(const InitialState());

  void selectSixthMan(Player newSixthMan) async {
    emit(const SelectState());
    sixthMan = newSixthMan;
    emit(const InitialState());
  }

  Player? getSixthMan() => sixthMan;
}
