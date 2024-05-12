import 'package:dio/dio.dart';
import 'package:fantabasket_app_flutter/model/requests/login_request.dart';
import 'package:fantabasket_app_flutter/model/requests/registration_request.dart';
import 'package:fantabasket_app_flutter/model/requests/team_request.dart';
import 'package:fantabasket_app_flutter/model/responses/login_response.dart';
import 'package:fantabasket_app_flutter/model/responses/registration_response.dart';
import 'package:fantabasket_app_flutter/services/dto/create_team_dto.dart';
import 'package:fantabasket_app_flutter/services/dto/empty_response_dto.dart';
import 'package:fantabasket_app_flutter/services/dto/player_dto.dart';
import 'package:fantabasket_app_flutter/services/dto/rank_teams_dto.dart';
import 'package:fantabasket_app_flutter/services/dto/team_list_dto.dart';
import 'package:fantabasket_app_flutter/services/dto/user_dto.dart';
import 'package:fantabasket_app_flutter/services/dto/team_detail_dto.dart';
import 'package:retrofit/dio.dart';

import 'package:retrofit/http.dart';
part 'team_service.g.dart';

@RestApi()
abstract class TeamService {
  factory TeamService(Dio dio, {String baseUrl}) = _TeamService;

  @GET('api/viewMyFantaTeams')
  Future<HttpResponse<TeamListDTO>> getTeams();

  @GET('api/detailFantaTeam')
  Future<HttpResponse<TeamDetailDTO>> getTeamDetail(
      @Query("idTeam") int teamId);

  @GET('api/viewFantaTeams')
  Future<HttpResponse<RankTeamsDTO>> getTeamsRanked(@Query("stage") int stage);

  @POST('api/addPlayerTeam')
  Future<HttpResponse<ApiEmptyResponseDTO>> addPlayerToTeam(
      @Body() AddPlayerToTeamRequest addPlayerToTeamRequest);

  @POST('api/addFantaTeam')
  Future<HttpResponse<CreateTeamDTO>> createTeam(
      @Body() CreateTeamRequest createTeamRequest);

  @POST('api/editFantaTeam')
  Future<HttpResponse<CreateTeamDTO>> editTeam(
      @Body() EditTeamRequest createTeamRequest);
}
