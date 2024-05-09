import 'package:fantabasket_app_flutter/model/player_in_rank.dart';
import 'package:fantabasket_app_flutter/model/players_in_rank.dart';
import 'package:fantabasket_app_flutter/services/dto/rank_teams_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class RankTeamsMapper extends DTOMapper<RankTeamsDTO, PlayersInRank> {
  @override
  PlayersInRank fromDTO(RankTeamsDTO dto) {
    List<PlayerInRank> list = [];
    RankTeamMapper playerMapper = RankTeamMapper();
    if (dto.fantateams != null) {
      for (var team in dto.fantateams!) {
        list.add(playerMapper.fromDTO(team));
      }
    }
    return PlayersInRank(count: list.length, teams: list);
  }

  @override
  RankTeamsDTO toDTO(PlayersInRank model) {
    throw UnimplementedError();
  }
}

class RankTeamMapper extends DTOMapper<RankTeamDTO, PlayerInRank> {
  @override
  PlayerInRank fromDTO(RankTeamDTO dto) => PlayerInRank(
      id: dto.id!,
      owner: dto.owner,
      teamName: dto.teamName,
      points: dto.points ?? 0,
      photo: dto.photo ?? '');

  @override
  RankTeamDTO toDTO(PlayerInRank model) {
    throw UnimplementedError();
  }
}
