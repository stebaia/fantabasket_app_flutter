part of 'dependency_injector.dart';

final List<SingleChildWidget> _mappers = [
  Provider<Mapper<User, String>>(
    create: (_) => UserToStringMapper(),
  ),
  Provider<DTOMapper<UserDTO, User>>(
    create: (_) => UserMapper(),
  ),
  Provider<DTOMapper<PlayerDTO, PlayersList>>(
    create: (_) => PlayerListMapper(),
  ),
  Provider<DTOMapper<PlayerDetailDTO, Player>>(
    create: (_) => PlayerMapper(),
  )
];
