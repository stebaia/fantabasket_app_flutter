import 'package:dio/dio.dart';
import 'package:fantabasket_app_flutter/model/requests/login_request.dart';
import 'package:fantabasket_app_flutter/model/requests/registration_request.dart';
import 'package:fantabasket_app_flutter/model/responses/login_response.dart';
import 'package:fantabasket_app_flutter/model/responses/registration_response.dart';
import 'package:fantabasket_app_flutter/services/dto/empty_response_dto.dart';
import 'package:fantabasket_app_flutter/services/dto/player_dto.dart';
import 'package:fantabasket_app_flutter/services/dto/team_list_dto.dart';
import 'package:fantabasket_app_flutter/services/dto/user_dto.dart';
import 'package:retrofit/dio.dart';

import 'package:retrofit/http.dart';
part 'team_service.g.dart';

@RestApi()
abstract class TeamService {
  factory TeamService(Dio dio, {String baseUrl}) = _TeamService;

  @GET('api/viewTeams')
  Future<HttpResponse<TeamListDTO>> getTeams();

  @POST('api/addTeamStage')
  Future<HttpResponse<ApiEmptyResponseDTO>> addTeamToStage();

  @POST('api/addPlayerTeam')
  Future<HttpResponse<ApiEmptyResponseDTO>> addPlayerToTeam();

}
