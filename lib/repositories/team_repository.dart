import 'package:fantabasket_app_flutter/model/team_list.dart';
import 'package:fantabasket_app_flutter/network/team_service/team_service.dart';
import 'package:fantabasket_app_flutter/services/dto/team_list_dto.dart';
import 'package:logger/logger.dart';
import 'package:pine/utils/dto_mapper.dart';
import 'package:retrofit/retrofit.dart';

class TeamRepository {
  final TeamService teamService;
  final DTOMapper<TeamListDTO, TeamList> teamDTOMapper;
  final Logger logger;

  TeamRepository(
      {required this.teamService,
      required this.logger,
      required this.teamDTOMapper});

  Future<HttpResponse<TeamList>> getTeams() async {
    try {
      final response = await teamService.getTeams();
      TeamList stagesList = teamDTOMapper.fromDTO(response.data);
      return HttpResponse(stagesList, response.response);
    } catch (error, stackTrace) {
      logger.e('Error getting list of stage',
          error: error, stackTrace: stackTrace);
      rethrow;
    }
  }
}