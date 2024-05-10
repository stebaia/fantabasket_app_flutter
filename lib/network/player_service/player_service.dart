import 'package:dio/dio.dart';
import 'package:fantabasket_app_flutter/services/dto/player_dto.dart';
import 'package:fantabasket_app_flutter/services/dto/player_stats_dto.dart';
import 'package:retrofit/dio.dart';

import 'package:retrofit/http.dart';
part 'player_service.g.dart';

@RestApi()
abstract class PlayerService {
  factory PlayerService(Dio dio, {String baseUrl}) = _PlayerService;

  @GET('api/viewPlayers')
  Future<HttpResponse<PlayerDTO>> getPlayersStage(@Query("stage") int stage);

  @GET('api/viewPlayers')
  Future<HttpResponse<PlayerDTO>> getAllPlayers();

  @GET('api/detailPlayer')
  Future<HttpResponse<PlayerStatsDTO>> getPlayerDetails(
      @Query("player") int playerId);
}
