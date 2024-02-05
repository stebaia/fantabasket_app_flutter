import 'dart:convert';

import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/players_list.dart';
import 'package:fantabasket_app_flutter/model/requests/login_request.dart';
import 'package:fantabasket_app_flutter/model/requests/registration_request.dart';
import 'package:fantabasket_app_flutter/model/responses/login_response.dart';
import 'package:fantabasket_app_flutter/model/responses/registration_response.dart';
import 'package:fantabasket_app_flutter/model/user.dart';
import 'package:fantabasket_app_flutter/network/player_service/player_service.dart';
import 'package:fantabasket_app_flutter/network/user_service/user_service.dart';
import 'package:fantabasket_app_flutter/services/dto/player_dto.dart';
import 'package:fantabasket_app_flutter/services/dto/user_dto.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:fantabasket_app_flutter/utils/date_converter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:crypto/crypto.dart';
import 'package:logger/logger.dart';
import 'package:pine/utils/dto_mapper.dart';
import 'package:pine/utils/mapper.dart';
import 'package:retrofit/dio.dart';

class PlayerRepository {
  final PlayerService playerService;
  final DTOMapper<PlayerDTO, PlayersList> playerDTOMapper;
  final Logger logger;

  PlayerRepository(
      {required this.playerService,
      required this.logger,
      required this.playerDTOMapper});

  Future<HttpResponse<PlayersList>> getPlayers() async {
    try {
      final response = await playerService.getPlayers();
      PlayersList playersList = playerDTOMapper.fromDTO(response.data);
      return HttpResponse(playersList, response.response);
    } catch (error, stackTrace) {
      logger.e('Error getting list of player',
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
