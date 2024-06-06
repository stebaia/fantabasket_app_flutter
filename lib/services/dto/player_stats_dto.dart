import 'package:equatable/equatable.dart';
import 'package:fantabasket_app_flutter/model/player_stats.dart';
import 'package:pine/pine.dart';

class PlayerStatsDTO extends DTO with EquatableMixin {
  List<StageStatsDTO>? data;
  int? code;
  bool? status;
  String? msg;

  PlayerStatsDTO({this.data, this.code, this.status});

  PlayerStatsDTO.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      for (var v in (json['data'] as List<dynamic>)) {
        data!.add(StageStatsDTO.fromJson(v as Map<String, dynamic>));
      }
    }
    code = json['code'];
    status = json['status'];
    msg = json['msg'];
  }

  @override
  List<Object?> get props => [data, code, status];
}

class StageStatsDTO extends DTO with EquatableMixin {
  List<PlayerDayDTO>? playerDays;
  int? stageId;
  String? stageName;
  int? points;
  String? name;
  String? surname;
  String? photo;
  String? category;
  String? team;
  PlayerStats? playerStats;

  StageStatsDTO({
    this.playerDays,
    this.stageId,
    this.stageName,
    this.points,
    this.playerStats,
  });

  StageStatsDTO.fromJson(Map<String, dynamic> json) {
    stageId = json['id_tappa'] as int?;
    stageName = json['nome_tappa'] as String?;
    points = json['punteggio'] as int?;
    name = json['nome'] as String?;
    surname = json['cognome'] as String?;
    photo = json['foto'] as String?;
    category = json['categoria'] as String?;
    team = json['squadra'] as String?;
    if (json['giornate'] != null &&
        (json['giornate'] as List<dynamic>).isNotEmpty) {
      playerDays = [];
      for (var v in (json['giornate'] as List<dynamic>)) {
        playerDays!.add(PlayerDayDTO.fromJson(v as Map<String, dynamic>));
      }
    }
    if (json['statistiche'] != null) {
      playerStats =
          PlayerStats.fromJson(json['statistiche'] as Map<String, dynamic>);
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

  @override
  List<Object?> get props => [stageId, stageName, points, playerDays];
}

class PlayerDayDTO extends DTO with EquatableMixin {
  BonusDTO? bonus;
  MalusDTO? malus;
  String? id;
  String? dayName;
  int? points;

  PlayerDayDTO({
    this.bonus,
    this.malus,
    this.id,
    this.dayName,
    this.points,
  });

  PlayerDayDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    dayName = json['nome'] as String?;
    points = json['punteggio'] as int?;
    if (json['bonus'] != null &&
        (json['bonus'] as Map<String, dynamic>).isNotEmpty) {
      bonus = BonusDTO.fromJson(json['bonus'] as Map<String, dynamic>);
    }
    if (json['malus'] != null &&
        (json['malus'] as Map<String, dynamic>).isNotEmpty) {
      malus = MalusDTO.fromJson(json['malus'] as Map<String, dynamic>);
    }
  }

  @override
  List<Object?> get props => [id, dayName, points, bonus, malus];
}

class BonusDTO extends DTO with EquatableMixin {
  final String? pointMade;
  final String? assist;
  final String? block;
  final String? bounce;
  final String? buzzerBeater;
  final String? dunk;
  final String? ankleBreaker;
  final String? postAnd1Exultation;
  final String? pregameRitual;
  final String? teamVictory;
  final String? ignorantClothing;
  final String? speakerKiss;
  final String? victory51;
  final String? mostLoved;

  BonusDTO({
    this.pointMade,
    this.assist,
    this.block,
    this.bounce,
    this.buzzerBeater,
    this.dunk,
    this.ankleBreaker,
    this.postAnd1Exultation,
    this.pregameRitual,
    this.teamVictory,
    this.ignorantClothing,
    this.speakerKiss,
    this.victory51,
    this.mostLoved,
  });

  factory BonusDTO.fromJson(Map<String, dynamic> json) {
    return BonusDTO(
      pointMade: json['punto_realizzato'].toString(),
      assist: json['assist'].toString(),
      block: json['stoppata'].toString(),
      bounce: json['rimbalzo'].toString(),
      buzzerBeater: json['buzzer_beater'].toString(),
      dunk: json['schiacciata'].toString(),
      ankleBreaker: json['ankle_breaker'].toString(),
      postAnd1Exultation: json['esultanza_post_and_1'].toString(),
      pregameRitual: json['rituale_pre_partita'].toString(),
      teamVictory: json['vittoria_squadra'].toString(),
      ignorantClothing: json['abbigliamento_ignorante'].toString(),
      speakerKiss: json['bacio_bocca_speaker'].toString(),
      victory51: json['vinta_ai_51'].toString(),
      mostLoved: json['most_loved'].toString(),
    );
  }

  @override
  List<Object?> get props => [
        pointMade,
        assist,
        block,
        bounce,
        buzzerBeater,
        dunk,
        ankleBreaker,
        postAnd1Exultation,
        pregameRitual,
        teamVictory,
        ignorantClothing,
        speakerKiss,
        victory51,
        mostLoved,
      ];
}

class MalusDTO extends DTO with EquatableMixin {
  final String? airball;
  final String? fouls;
  final String? tacticalFouls;
  final String? teamDefeat;
  final String? reverseClothing;
  final String? worstTeam;
  final String? concededDunk;
  final String? lost51;
  final String? basketConcededBuzzerBeater;
  final String? shaqtinAFool;
  final String? invisibleNumber;
  final String? worstTeamName;

  MalusDTO({
    this.airball,
    this.fouls,
    this.tacticalFouls,
    this.teamDefeat,
    this.reverseClothing,
    this.worstTeam,
    this.concededDunk,
    this.lost51,
    this.basketConcededBuzzerBeater,
    this.shaqtinAFool,
    this.invisibleNumber,
    this.worstTeamName,
  });

  factory MalusDTO.fromJson(Map<String, dynamic> json) {
    return MalusDTO(
      airball: json['airball'].toString(),
      fouls: json['fallo'].toString(),
      tacticalFouls: json['fallo_tattico'].toString(),
      teamDefeat: json['perdita_squadra'].toString(),
      reverseClothing: json['abbigliamento_al_contrario'].toString(),
      worstTeam: json['squadra_peggiore_della_giornata'].toString(),
      concededDunk: json['schiacciata_subita_squadra'].toString(),
      lost51: json['persa_ai_51'].toString(),
      basketConcededBuzzerBeater:
          json['canestro_subito_buzzer_beater'].toString(),
      shaqtinAFool: json['shaqtin_a_fool'].toString(),
      invisibleNumber: json['numero_giocatore_non_visibile'].toString(),
      worstTeamName: json['nome_squadra_più_brutto'].toString(),
    );
  }

  @override
  List<Object?> get props => [
        airball,
        fouls,
        tacticalFouls,
        teamDefeat,
        reverseClothing,
        worstTeam,
        concededDunk,
        lost51,
        basketConcededBuzzerBeater,
        shaqtinAFool,
        invisibleNumber,
        worstTeamName,
      ];
}
