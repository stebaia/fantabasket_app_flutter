part of 'dependency_injector.dart';

final List<RepositoryProvider> _repositories = [
  // USER
  RepositoryProvider<UserRepository>(create: ((context) {
    final secureStorage = context.read<FlutterSecureStorage>();

    final userRepository = UserRepository(
        flutterSecureStorage: context.read(),
        userDTOMapper: context.read(),
        userService: context.read(),
        userMapper: context.read(),
        logger: context.read());
    context
        .read<Dio>()
        .interceptors
        .insert(0, AuthInterceptor(repository: userRepository));
    return userRepository;
  })),
  RepositoryProvider<PlayerRepository>(create: ((context) {
    final playerRepository = PlayerRepository(
        playerService: context.read(),
        playerDTOMapper: context.read(),
        logger: context.read());
    context
        .read<Dio>()
        .interceptors
        .insert(0, AuthInterceptor(repository: context.read()));
    return playerRepository;
  })),
  //STAGES
  RepositoryProvider<StagesRepository>(create: ((context) {
    final playerRepository = StagesRepository(
        stageService: context.read(),
        stageDTOMapper: context.read(),
        logger: context.read());
    context
        .read<Dio>()
        .interceptors
        .insert(0, AuthInterceptor(repository: context.read()));
    return playerRepository;
  })),
  RepositoryProvider<TeamRepository>(create: ((context) {
    final teamRepository = TeamRepository(
        teamDTOMapper: context.read(),
        teamDetailDTOMapper: context.read(),
        rankDTOMapper: context.read(),
        teamService: context.read(),
        logger: context.read());
    context
        .read<Dio>()
        .interceptors
        .insert(0, AuthInterceptor(repository: context.read()));
    return teamRepository;
  })),

  // VEHICLE
];
