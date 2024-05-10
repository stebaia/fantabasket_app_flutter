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
    // TODO: implement toDTO
    throw UnimplementedError();
  }
}

class PlayerMapper extends DTOMapper<PlayerDetailDTO, Player> {
  @override
  Player fromDTO(PlayerDetailDTO dto) => Player(
      id: int.parse(dto.id ?? '0'),
      firstName: dto.firstName ?? '',
      lastName: dto.lastName ?? '',
      value: dto.value ?? 0,
      team: dto.team ?? '',
      photo: dto.photo ?? '',
      phone: dto.phone ?? '',
      category: dto.category ?? '',
      email: dto.email ?? '');

  @override
  PlayerDetailDTO toDTO(Player model) {
    // TODO: implement toDTO
    throw UnimplementedError();
  }
}
