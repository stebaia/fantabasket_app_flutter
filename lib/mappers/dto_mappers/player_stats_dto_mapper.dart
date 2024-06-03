import 'package:fantabasket_app_flutter/model/bonus.dart';
import 'package:fantabasket_app_flutter/model/malus.dart';
import 'package:fantabasket_app_flutter/model/player_match.dart';
import 'package:fantabasket_app_flutter/model/players_stats_list.dart';
import 'package:fantabasket_app_flutter/model/stage_stats.dart';
import 'package:fantabasket_app_flutter/services/dto/player_stats_dto.dart';
import 'package:pair/pair.dart';
import 'package:pine/pine.dart';

class PlayerStatsMapper extends DTOMapper<PlayerStatsDTO, PlayersStatsList> {
  @override
  PlayersStatsList fromDTO(PlayerStatsDTO dto) {
    List<StageStats> players = [];
    StageStatsMapper stageStatsMapper = StageStatsMapper();
    if (dto.data != null) {
      for (var element in dto.data!) {
        players.add(stageStatsMapper.fromDTO(element));
      }
    }
    return PlayersStatsList(
      count: dto.data?.length ?? 0,
      stages: players,
    );
  }

  @override
  PlayerStatsDTO toDTO(PlayersStatsList model) {
    throw UnimplementedError();
  }
}

class StageStatsMapper extends DTOMapper<StageStatsDTO, StageStats> {
  @override
  StageStats fromDTO(StageStatsDTO dto) {
    final List<PlayerMatch> matches = [];
    if (dto.playerDays != null) {
      for (var element in dto.playerDays!) {
        matches.add(PlayerMatchMapper().fromDTO(element));
      }
    }
    return StageStats(
        points: dto.points ?? 0,
        stageName: dto.stageName ?? '',
        matches: matches,
        category: dto.category ?? '',
        name: dto.name ?? '',
        photo: dto.photo ?? '',
        surname: dto.surname ?? '',
        team: dto.team ?? '',
        playerStats: dto.playerStats!);
  }

  @override
  StageStatsDTO toDTO(StageStats model) {
    throw UnimplementedError();
  }
}

class PlayerMatchMapper extends DTOMapper<PlayerDayDTO, PlayerMatch> {
  @override
  PlayerMatch fromDTO(PlayerDayDTO dto) {
    return PlayerMatch(
      bonus: dto.bonus != null ? BonusMapper().fromDTO(dto.bonus!) : null,
      malus: dto.malus != null ? MalusMapper().fromDTO(dto.malus!) : null,
      day: dto.dayName ?? '',
      points: dto.points ?? 0,
    );
  }

  @override
  PlayerDayDTO toDTO(PlayerMatch model) {
    throw UnimplementedError();
  }
}

class BonusMapper extends DTOMapper<BonusDTO, Bonus> {
  @override
  Bonus fromDTO(BonusDTO dto) {
    return Bonus(
      ankleBreaker: Pair("Ankle breaker", dto.ankleBreaker ?? ''),
      assist: Pair("Assist", dto.assist ?? ''),
      block: Pair("Stoppata", dto.block ?? ''),
      bounce: Pair("Rimbalzi", dto.bounce ?? ''),
      buzzerBeater: Pair("Buzzer beater", dto.buzzerBeater ?? ''),
      dunk: Pair("Schiacciata", dto.dunk ?? ''),
      ignorantClothing:
          Pair("Abbigliamento ignorante", dto.ignorantClothing ?? ''),
      mostLoved: Pair("Most loved", dto.mostLoved ?? ''),
      pointMade: Pair("Punto realizzato", dto.pointMade ?? ''),
      postAnd1Exultation:
          Pair("Esultanza post and 1", dto.postAnd1Exultation ?? ''),
      pregameRitual: Pair("Rituale pre-partita", dto.pregameRitual ?? ''),
      speakerKiss: Pair("Bacio allo speaker", dto.speakerKiss ?? ''),
      teamVictory: Pair("Vittoria squadra", dto.teamVictory ?? ''),
      victory51: Pair("Vittoria ai 51", dto.victory51 ?? ''),
    );
  }

  @override
  BonusDTO toDTO(Bonus model) {
    throw UnimplementedError();
  }
}

class MalusMapper extends DTOMapper<MalusDTO, Malus> {
  @override
  Malus fromDTO(MalusDTO dto) {
    return Malus(
      airball: Pair("Airball", dto.airball ?? ''),
      basketConcededBuzzerBeater: Pair("Canestro subito buzzer beater",
          dto.basketConcededBuzzerBeater ?? ''),
      concededDunk: Pair("Schiacciata subita squadra", dto.concededDunk ?? ''),
      fouls: Pair("Falli", dto.fouls ?? ''),
      invisibleNumber:
          Pair("Numero giocatore non visibile", dto.invisibleNumber ?? ''),
      lost51: Pair("Persa ai 51", dto.lost51 ?? ''),
      reverseClothing:
          Pair("Abbigliamento al contrario", dto.reverseClothing ?? ''),
      shaqtinAFool: Pair("Shaqtin a fool", dto.shaqtinAFool ?? ''),
      tacticalFouls: Pair("Falli tattici", dto.tacticalFouls ?? ''),
      teamDefeat: Pair("Sconfitta squadra", dto.teamDefeat ?? ''),
      worstTeam: Pair("Squadra peggiore della giornata", dto.worstTeam ?? ''),
      worstTeamName: Pair("Nome squadra più brutto", dto.worstTeamName ?? ''),
    );
  }

  @override
  MalusDTO toDTO(Malus model) {
    throw UnimplementedError();
  }
}
