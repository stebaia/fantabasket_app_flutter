import 'package:fantabasket_app_flutter/model/match_day.dart';
import 'package:fantabasket_app_flutter/model/player_stats_sint.dart';
import 'package:fantabasket_app_flutter/model/team_detail.dart';
import 'package:fantabasket_app_flutter/services/dto/player_dto.dart';
import 'package:fantabasket_app_flutter/services/dto/team_detail_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class TeamDetailMapper extends DTOMapper<TeamDetailDTO, TeamDetail> {
  @override
  TeamDetail fromDTO(TeamDetailDTO dto) {
    List<MatchDay> list = [];
    DayMapper dayMapper = DayMapper();
    if (dto.days != null) {
      for (var day in dto.days!) {
        list.add(dayMapper.fromDTO(day));
      }
    }
    return TeamDetail(name: "", totalPoints: dto.points ?? 0, days: list);
  }

  @override
  TeamDetailDTO toDTO(TeamDetail model) {
    throw UnimplementedError();
  }
}

class DayMapper extends DTOMapper<DayDTO, MatchDay> {
  @override
  MatchDay fromDTO(DayDTO dto) {
    List<PlayerStatsSint> players = [];
    PlayerSintMapper psMapper = PlayerSintMapper();
    if (dto.players != null) {
      for (var p in dto.players!) {
        players.add(psMapper.fromDTO(p));
      }
    }
    return MatchDay(
      day: dto.name ?? "",
      points: dto.points ?? 0,
      players: players,
    );
  }

  @override
  DayDTO toDTO(MatchDay model) {
    throw UnimplementedError();
  }
}

class PlayerSintMapper extends DTOMapper<PlayerSintDTO, PlayerStatsSint> {
  @override
  PlayerStatsSint fromDTO(PlayerSintDTO dto) => PlayerStatsSint(
        id: int.parse(dto.id!),
        firstName: dto.firstName ?? '',
        lastName: dto.lastName ?? '',
        photo: dto.photo ?? '',
        category: dto.category ?? '',
        team: dto.team ?? '',
        captain: dto.captain!,
        reserve: dto.reserve!,
        bonus: dto.bonus ?? 0,
        malus: dto.malus ?? 0,
        total: dto.total ?? 0,
      );

  @override
  PlayerSintDTO toDTO(PlayerStatsSint model) {
    throw UnimplementedError();
  }
}
