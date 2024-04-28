import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/services/dto/player_dto.dart';
import 'package:pine/pine.dart';

class TeamDetailDTO extends DTO with EquatableMixin {
  bool? status;
  String? msg;
  int? points;
  List<DayDTO>? days;
  int? code;

  TeamDetailDTO({this.status, this.msg, this.points, this.days, this.code});

  TeamDetailDTO.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null && (json['data'] as List<dynamic>).isNotEmpty) {
      days = <DayDTO>[];
      var list = json['data'] as List<dynamic>;
      var map = list.first as Map<String, dynamic>;
      points = map['punteggio'] as int?;
      var dayList = map['giornate'] as List<dynamic>;
      for (var d in dayList) {
        days!.add(DayDTO.fromJson(d as Map<String, dynamic>));
      }
    }
    code = json['code'];
  }

  @override
  List<Object?> get props => [status, msg, days, code];
}

class DayDTO extends DTO with EquatableMixin {
  String? name;
  int? points;
  List<PlayerDetailDTO>? players;

  DayDTO({
    this.name,
    this.points,
    this.players,
  });

  DayDTO.fromJson(Map<String, dynamic> map) {
    name = map['nome'];
    points = map['points'];
    var pls = map['giocatori'] as List<dynamic>;
    players = [];
    for (var p in pls) {
      players!.add(PlayerDetailDTO.fromJson(p as Map<String, dynamic>));
    }
  }

  @override
  List<Object?> get props => [name, points, players];
}
