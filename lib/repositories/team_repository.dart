import 'package:fantabasket_app_flutter/model/requests/team_request.dart';
import 'package:fantabasket_app_flutter/model/team_list.dart';
import 'package:fantabasket_app_flutter/network/team_service/team_service.dart';
import 'package:fantabasket_app_flutter/services/dto/create_team_dto.dart';
import 'package:fantabasket_app_flutter/services/dto/empty_response_dto.dart';
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
      TeamList teamList = teamDTOMapper.fromDTO(response.data);
      return HttpResponse(teamList, response.response);
    } catch (error, stackTrace) {
      logger.e('Error getting list of teams',
          error: error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<HttpResponse<CreateTeamDTO>> createTeam({
    required String name,
    required List<int> player,
    required int cpt,
  }) async {
    try {
      CreateTeamRequest request = CreateTeamRequest(
        name: name,
        player: player,
        cpt: cpt,
      );

      print(request.toJson());

      final response = await teamService.createTeam(request);
      return response;
    } catch (error, stackTrace) {
      logger.e('Error in team creation', error: error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<HttpResponse<ApiEmptyResponseDTO>> addTeamToStage({
    required int teamId,
    required int stageId,
  }) async {
    try {
      final response = await teamService.addTeamToStage(AddTeamToStageRequest(
        idStage: stageId.toString(),
        idTeam: teamId.toString(),
      ));
      print("Result in repo: ${response.data}");
      return response;
    } catch (error, stackTrace) {
      logger.e('Error in team creation', error: error, stackTrace: stackTrace);
      rethrow;
    }
  }
}
