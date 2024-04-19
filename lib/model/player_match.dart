import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/bonus.dart';
import 'package:fantabasket_app_flutter/model/malus.dart';

class PlayerMatch extends Equatable {
  final int dayNumber;
  final Bonus bonus;
  final Malus malus;

  const PlayerMatch({
    required this.dayNumber,
    required this.bonus,
    required this.malus,
  });

  @override
  List<Object?> get props => [
        dayNumber,
        bonus,
        malus,
      ];
}
