import 'package:fantabasket_app_flutter/model/players_list.dart';
import 'package:fantabasket_app_flutter/model/players_stats_list.dart';
import 'package:fantabasket_app_flutter/network/player_service/player_service.dart';
import 'package:fantabasket_app_flutter/services/dto/player_dto.dart';
import 'package:fantabasket_app_flutter/services/dto/player_stats_dto.dart';
import 'package:logger/logger.dart';
import 'package:pine/utils/dto_mapper.dart';
import 'package:retrofit/dio.dart';

class PlayerRepository {
  final PlayerService playerService;
  final DTOMapper<PlayerDTO, PlayersList> playerDTOMapper;
  final DTOMapper<PlayerStatsDTO, PlayersStatsList> playerStatsDTOMapper;
  final Logger logger;

  PlayerRepository({
    required this.playerService,
    required this.logger,
    required this.playerDTOMapper,
    required this.playerStatsDTOMapper,
  });

  Future<HttpResponse<PlayersList>> getPlayers(int stage) async {
    try {
      final response = await playerService.getPlayersStage(stage);
      PlayersList playersList = playerDTOMapper.fromDTO(response.data);
      return HttpResponse(playersList, response.response);
    } catch (error, stackTrace) {
      logger.e('Error getting list of player',
          error: error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<HttpResponse<PlayersList>> getAllPlayers() async {
    try {
      final response = await playerService.getAllPlayers();
      PlayersList playersList = playerDTOMapper.fromDTO(response.data);
      final set = <int>{};
      set.addAll(playersList.players!.map((p) => p.id));
      var players = set
          .map((id) => playersList.players!.firstWhere((p) => p.id == id))
          .toList();
      PlayersList list = PlayersList(count: set.length, players: players);
      list.players!
          .sort((b, a) => a.points!.pointMade.compareTo(b.points!.pointMade));
      return HttpResponse(list, response.response);
    } catch (error, stackTrace) {
      logger.e('Error getting list of player',
          error: error, stackTrace: stackTrace);
      rethrow;
    }
  }

  Future<HttpResponse<PlayersStatsList>> getPlayerDetails(int playerId) async {
    try {
      final response = await playerService.getPlayerDetails(playerId);
      PlayersStatsList playerStatsList =
          playerStatsDTOMapper.fromDTO(response.data);
      return HttpResponse(playerStatsList, response.response);
    } catch (error, stackTrace) {
      logger.e('Error getting detail of player',
          error: error, stackTrace: stackTrace);
      rethrow;
    }
  }

  /*Future<User> fakeLogin({
    required String email,
    required String password,
  }) async {
    try {
      User user;
      if (email == 'test@test.it') {
        user = User(
            id: 1,
            name: "rental",
            surname: "rental",
            email: email,
            birth: "01/12/1990",
            registrationDate: "13/11/2023",
            lastLogin: "13/11/2023",
            isCharterer: true);
      } else {
        user = User(
            id: 1,
            name: "ProvaName",
            surname: "ProvaSurname",
            email: email,
            birth: "01-12-1990",
            registrationDate: "13/11/2023",
            lastLogin: "13/11/2023",
            isCharterer: false);
      }
      await flutterSecureStorage.write(
          key: Constants.userKey, value: userMapper.from(user));
      return user;
    } catch (e) {
      logger.e(
        'Error sing in with email $email',
        error: e,
      );
      rethrow;
    }
  }
*/
}
