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
  BlocProvider<CreditsCubit>(
    create: (context) => CreditsCubit(context: context),
  ),
  BlocProvider<CaptainCubit>(
    create: (context) => CaptainCubit(context: context),
  ),
  BlocProvider<SixthManCubit>(
    create: (context) => SixthManCubit(context: context),
  ),
  BlocProvider<AddTeamBloc>(
    create: ((context) => AddTeamBloc(teamRepository: context.read())),
  ),
];
