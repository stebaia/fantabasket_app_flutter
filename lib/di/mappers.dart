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
  ),
  Provider<DTOMapper<StageListDTO, StagesList>>(
    create: (_) => StageListMapper(),
  ),
  Provider<DTOMapper<StageDTO, Stage>>(
    create: (_) => StageMapper(),
  ),
  Provider<DTOMapper<TeamListDTO, TeamList>>(
    create: (_) => TeamListMapper(),
  ),
  Provider<DTOMapper<TeamDTO, Team>>(
    create: (_) => TeamMapper(),
  ),
  Provider<DTOMapper<RankTeamsDTO, PlayersInRank>>(
    create: (_) => RankTeamsMapper(),
  ),
  Provider<DTOMapper<RankTeamDTO, PlayerInRank>>(
    create: (_) => RankTeamMapper(),
  ),
  Provider<DTOMapper<TeamDetailDTO, TeamDetail>>(
    create: (_) => TeamDetailMapper(),
  ),
  Provider<DTOMapper<DayDTO, MatchDay>>(
    create: (_) => DayMapper(),
  ),
  Provider<DTOMapper<PlayerSintDTO, PlayerStatsSint>>(
    create: (_) => PlayerSintMapper(),
  ),
  Provider<DTOMapper<PlayerStatsDTO, PlayersStatsList>>(
    create: (_) => PlayerStatsMapper(),
  ),
  Provider<DTOMapper<StageStatsDTO, StageStats>>(
    create: (_) => StageStatsMapper(),
  ),
  Provider<DTOMapper<PlayerDayDTO, PlayerMatch>>(
    create: (_) => PlayerMatchMapper(),
  ),
  Provider<DTOMapper<BonusDTO, Bonus>>(
    create: (_) => BonusMapper(),
  ),
  Provider<DTOMapper<MalusDTO, Malus>>(
    create: (_) => MalusMapper(),
  ),
];
