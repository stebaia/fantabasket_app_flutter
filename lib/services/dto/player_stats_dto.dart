import 'package:equatable/equatable.dart';
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

  StageStatsDTO({
    this.playerDays,
    this.stageId,
    this.stageName,
    this.points,
  });

  StageStatsDTO.fromJson(Map<String, dynamic> json) {
    stageId = json['id_tappa'] as int?;
    stageName = json['nome_tappa'] as String?;
    points = json['punteggio'] as int?;
    if (json['giornate'] != null &&
        (json['giornate'] as List<dynamic>).isNotEmpty) {
      playerDays = [];
      for (var v in (json['giornate'] as List<dynamic>)) {
        playerDays!.add(PlayerDayDTO.fromJson(v as Map<String, dynamic>));
      }
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
      pointMade: json['punto_realizzato'] as String?,
      assist: json['assist'] as String?,
      block: json['stoppata'] as String?,
      bounce: json['rimbalzo'] as String?,
      buzzerBeater: json['buzzer_beater'] as String?,
      dunk: json['schiacciata'] as String?,
      ankleBreaker: json['ankle_breaker'] as String?,
      postAnd1Exultation: json['esultanza_post_and_1'] as String?,
      pregameRitual: json['rituale_pre_partita'] as String?,
      teamVictory: json['vittoria_squadra'] as String?,
      ignorantClothing: json['abbigliamento_ignorante'] as String?,
      speakerKiss: json['bacio_bocca_speaker'] as String?,
      victory51: json['vinta_ai_51'] as String?,
      mostLoved: json['most_loved'] as String?,
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
      airball: json['airball'] as String?,
      fouls: json['fallo'] as String?,
      tacticalFouls: json['fallo_tattico'] as String?,
      teamDefeat: json['perdita_squadra'] as String?,
      reverseClothing: json['abbigliamento_al_contrario'] as String?,
      worstTeam: json['squadra_peggiore_della_giornata'] as String?,
      concededDunk: json['schiacciata_subita_squadra'] as String?,
      lost51: json['persa_ai_51'] as String?,
      basketConcededBuzzerBeater:
          json['canestro_subito_buzzer_beater'] as String?,
      shaqtinAFool: json['shaqtin_a_fool'] as String?,
      invisibleNumber: json['numero_giocatore_non_visibile'] as String?,
      worstTeamName: json['nome_squadra_più_brutto'] as String?,
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
