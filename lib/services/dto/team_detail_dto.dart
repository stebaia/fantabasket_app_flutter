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
  List<PlayerSintDTO>? players;

  DayDTO({
    this.name,
    this.points,
    this.players,
  });

  DayDTO.fromJson(Map<String, dynamic> map) {
    name = map['nome'] as String?;
    points = map['punteggio'] as int?;
    var pls = map['giocatori'] as List<dynamic>;
    players = [];
    for (var p in pls) {
      players!.add(PlayerSintDTO.fromJson(p as Map<String, dynamic>));
    }
  }

  @override
  List<Object?> get props => [name, points, players];
}

class PlayerSintDTO extends DTO with EquatableMixin {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? photo;
  final String? category;
  final String? team;
  final bool? captain;
  final bool? reserve;
  final int? bonus;
  final int? malus;
  final int? total;

  PlayerSintDTO({
    this.id,
    this.firstName,
    this.lastName,
    this.photo,
    this.category,
    this.team,
    this.captain,
    this.reserve,
    this.bonus,
    this.malus,
    this.total,
  });

  factory PlayerSintDTO.fromJson(Map<String, dynamic> json) {
    return PlayerSintDTO(
      id: json['id'] as String?,
      firstName: json['nome'] as String?,
      lastName: json['cognome'] as String?,
      photo: json['foto'] as String?,
      category: json['categoria'] as String?,
      team: json['squadra'] as String?,
      captain: json['cpt'] as bool?,
      reserve: json['ris'] as bool?,
      bonus: json['bonus'] as int?,
      malus: json['malus'] as int?,
      total: json['totale'] as int?,
    );
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        photo,
        category,
        team,
        captain,
        reserve,
        bonus,
        malus,
        total,
      ];
}
