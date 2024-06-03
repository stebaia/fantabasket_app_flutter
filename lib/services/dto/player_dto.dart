import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player_stats.dart';
import 'package:pine/pine.dart';

class PlayerDTO extends DTO with EquatableMixin {
  List<PlayerDetailDTO>? data;
  int? code;
  bool? status;

  PlayerDTO({this.data, this.code, this.status});

  PlayerDTO.fromJson(Map<String, dynamic> json) {
    if (json['giocatori'] != null) {
      data = <PlayerDetailDTO>[];
      (json['giocatori'] as List<dynamic>).forEach((v) {
        data!.add(PlayerDetailDTO.fromJson(v));
      });
    }
    code = json['code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['giocatori'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = code;
    data['message'] = status;
    return data;
  }

  @override
  List<Object?> get props => [data, code, status];
}

class PlayerDetailDTO extends DTO with EquatableMixin {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? photo;
  String? category;
  String? team;
  int? value;
  PlayerDetailPointsDTO? points;
  PlayerStats? playerStats;

  PlayerDetailDTO({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.photo,
    this.category,
    this.team,
    this.value,
    this.playerStats,
  });

  PlayerDetailDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    firstName = json['nome'] as String?;
    lastName = json['cognome'] as String?;
    email = json['email'] as String?;
    phone = json['cellulare'] as String?;
    photo = json['foto'] as String?;
    category = json['categoria'] as String?;
    team = json['squadra'] as String?;
    value = json['punteggio'] == null ? 0 : json['punteggio'] as int;
    if (json['dettaglioPunteggio'] != null &&
        json['dettaglioPunteggio'] is Map<String, dynamic>) {
      points = (PlayerDetailPointsDTO.fromJson(json['dettaglioPunteggio']));
    } else {
      points = PlayerDetailPointsDTO(
        ankleBreaker: 0,
        assist: 0,
        block: 0,
        bounce: 0,
        dunk: 0,
        ignorantClothing: 0,
        pointMade: 0,
      );
    }
    if (json['statistiche'] != null) {
      playerStats = json['statistiche'];
    } else {
      playerStats = PlayerStats(
          abbigliamentoIgnorante: 0,
          ankleBreaker: 0,
          assist: 0,
          puntoRealizzato: 0,
          rimbalzo: 0,
          schiacciata: 0,
          stoppata: 0);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'foto': photo,
      'category': category,
      'team': team,
      'value': value
    };
  }

  @override
  List<Object?> get props => [
        id,
        phone,
        firstName,
        lastName,
        email,
        photo,
        category,
        team,
        value,
      ];
}

class PlayerDetailPointsDTO extends DTO with EquatableMixin {
  final int? pointMade;
  final int? assist;
  final int? block;
  final int? bounce;
  final int? dunk;
  final int? ankleBreaker;
  final int? ignorantClothing;

  PlayerDetailPointsDTO(
      {this.pointMade,
      this.assist,
      this.block,
      this.bounce,
      this.dunk,
      this.ankleBreaker,
      this.ignorantClothing});

  factory PlayerDetailPointsDTO.fromJson(Map<String, dynamic> json) {
    return PlayerDetailPointsDTO(
      pointMade: json['punto_realizzato'] as int?,
      assist: json['assist'] as int?,
      block: json['stoppata'] as int?,
      bounce: json['rimbalzo'] as int?,
      dunk: json['schiacciata'] as int?,
      ankleBreaker: json['ankle_breaker'] as int?,
      ignorantClothing: json['abbigliamento_ignorante'] as int?,
    );
  }

  @override
  List<Object?> get props => [
        pointMade,
        assist,
        block,
        bounce,
        dunk,
        ankleBreaker,
        ignorantClothing,
      ];
}
