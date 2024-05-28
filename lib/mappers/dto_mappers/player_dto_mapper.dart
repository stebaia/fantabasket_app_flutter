import 'package:fantabasket_app_flutter/model/bonus.dart';
import 'package:fantabasket_app_flutter/model/bonus_short.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/players_list.dart';
import 'package:fantabasket_app_flutter/services/dto/player_dto.dart';
import 'package:pine/pine.dart';

class PlayerListMapper extends DTOMapper<PlayerDTO, PlayersList> {
  @override
  PlayersList fromDTO(PlayerDTO dto) {
    List<Player> players = [];
    PlayerMapper playerMapper = PlayerMapper();
    if (dto.data != null) {
      dto.data!.forEach((element) {
        players.add(playerMapper.fromDTO(element));
      });
    }
    players.sort((b, a) => a.value.compareTo(b.value));
    return PlayersList(count: dto.data?.length ?? 0, players: players);
  }

  @override
  PlayerDTO toDTO(PlayersList model) {
    throw UnimplementedError();
  }
}

class PlayerMapper extends DTOMapper<PlayerDetailDTO, Player> {
  @override
  Player fromDTO(PlayerDetailDTO dto) {
    var points = dto.points;
    BonusShort? bonus;
    if (points != null) {
      bonus = BonusShort(
        pointMade: points.pointMade!,
        assist: points.assist!,
        block: points.block!,
        bounce: points.bounce!,
        dunk: points.dunk!,
        ankleBreaker: points.ankleBreaker!,
        ignorantClothing: points.ignorantClothing!,
      );
    }
    return Player(
      id: int.parse(dto.id ?? '0'),
      firstName: dto.firstName ?? '',
      lastName: dto.lastName ?? '',
      value: dto.value ?? 0,
      team: dto.team ?? '',
      photo: dto.photo ?? '',
      phone: dto.phone ?? '',
      category: dto.category ?? '',
      email: dto.email ?? '',
      points: bonus,
    );
  }

  @override
  PlayerDetailDTO toDTO(Player model) {
    throw UnimplementedError();
  }
}
