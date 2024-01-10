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
    context.read<Dio>().interceptors.insert(
        0,
        AuthInterceptor(
            repository: userRepository,
            ));
    return userRepository;
  })),

  // VEHICLE
];
