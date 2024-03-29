import 'package:dio/dio.dart';
import 'package:fantabasket_app_flutter/model/requests/login_request.dart';
import 'package:fantabasket_app_flutter/model/requests/registration_request.dart';
import 'package:fantabasket_app_flutter/model/responses/login_response.dart';
import 'package:fantabasket_app_flutter/model/responses/registration_response.dart';
import 'package:fantabasket_app_flutter/services/dto/player_dto.dart';
import 'package:fantabasket_app_flutter/services/dto/user_dto.dart';
import 'package:retrofit/dio.dart';

import 'package:retrofit/http.dart';
part 'player_service.g.dart';

@RestApi()
abstract class PlayerService {
  factory PlayerService(Dio dio, {String baseUrl}) = _PlayerService;

  @GET('api/viewPlayers')
  Future<HttpResponse<PlayerDTO>> getPlayers();

  @GET('api/viewPlayersStage')
  Future<HttpResponse<PlayerDTO>> getPlayersStage(@Query("stage") int stage);
}
