part of 'dependency_injector.dart';

final List<BlocProvider> _blocs = [
  BlocProvider<AuthCubit>(
    create: (context) =>
        AuthCubit(userRepository: context.read(), context: context)
          ..checkAuthenticationState(),
  ),
  BlocProvider<CreateTeamBloc>(
    create: ((context) =>
        CreateTeamBloc(stagesRepository: context.read()..getStages())),
  ),
  BlocProvider<SelectTeamBloc>(
    create: ((context) =>
        SelectTeamBloc(stagesRepository: context.read()..getPlayers())),
  ),
];
