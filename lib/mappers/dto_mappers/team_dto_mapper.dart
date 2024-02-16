import 'package:fantabasket_app_flutter/model/team.dart';
import 'package:fantabasket_app_flutter/model/team_list.dart';
import 'package:fantabasket_app_flutter/services/dto/team_list_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class TeamListMapper extends DTOMapper<TeamListDTO, TeamList> {
  @override
  // ignore: prefer_if_null_operators
  TeamList fromDTO(TeamListDTO dto) {
    List<Team> players = [];
    TeamMapper playerMapper = new TeamMapper();
    if (dto.data != null) {
      dto.data!.forEach((element) {
        players.add(playerMapper.fromDTO(element));
      });
    }
    return TeamList(count: dto.data?.length ?? 0, teams: players);
  }

  @override
  TeamListDTO toDTO(TeamList model) {
    // TODO: implement toDTO
    throw UnimplementedError();
  }
}

class TeamMapper extends DTOMapper<TeamDTO, Team> {
  @override
  Team fromDTO(TeamDTO dto) => Team(
      id: int.parse(dto.id ?? '0'),
      nome: dto.nome ?? '',
      user: dto.user ?? ''
      );

  @override
  TeamDTO toDTO(Team model) {
    // TODO: implement toDTO
    throw UnimplementedError();
  }
}
