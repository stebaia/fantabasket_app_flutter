import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/banner_bloc/banner_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/credits_cubit/credits_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/select_team_bloc/select_team_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/select_player_bloc/select_player_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/team_detail_bloc/team_detail_bloc.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/model/team.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:fantabasket_app_flutter/ui/widgets/double_spinner.dart';
import 'package:fantabasket_app_flutter/ui/widgets/player_icon.dart';
import 'package:fantabasket_app_flutter/ui/widgets/sponsors_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SelectTeamPage extends StatelessWidget with AutoRouteWrapper {
  final int stageId;
  final Team? team;

  const SelectTeamPage({
    required this.stageId,
    this.team,
    super.key,
  });

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<SelectTeamBloc>(
            create: ((context) => SelectTeamBloc(
                stagesRepository: context.read(),
                playerRepository: context.read())
              ..getPlayers(stageId)),
          ),
          BlocProvider<CreditsCubit>(
            create: ((context) => CreditsCubit(context: context)),
          ),
          BlocProvider<SelectPlayerBloc>(
            create: ((context) => SelectPlayerBloc()),
          ),
          BlocProvider<BannerBloc>(
            create: ((context) =>
                BannerBloc(repository: context.read())..getBannerList()),
          ),
          BlocProvider<TeamDetailBloc>(
            create: ((context) {
              if (team != null) {
                return TeamDetailBloc(teamRepository: context.read())
                  ..getTeamDetail(stageId);
              }
              return TeamDetailBloc(teamRepository: context.read());
            }),
          ),
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);
    final bool edit = team != null;

    return PopScope(
        onPopInvoked: (value) => context.read<CreditsCubit>().resetTotal(),
        child: BlocBuilder<TeamDetailBloc, TeamDetailState>(
            builder: (precontext, prestate) {
          return BlocBuilder<SelectTeamBloc, SelectTeamState>(
              builder: (context, upstate) {
            return Scaffold(
                backgroundColor: Theme.of(context).colorScheme.primary,
                appBar: AppBar(
                  foregroundColor:
                      darkMode.darkTheme ? Colors.white : Colors.black,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  title: const Text(
                    'Scegli il tuo quintetto',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  automaticallyImplyLeading: true,
                  actions: [
                    BlocConsumer<SelectPlayerBloc, SelectPlayerState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        var players = context
                            .read<SelectPlayerBloc>()
                            .getCheckedPlayers();
                        var size = players.length;
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: GestureDetector(
                            onTap: () =>
                                upstate is ResultGetPlayersState && size == 5
                                    ? context.router.push(CompletionRoute(
                                        team: players,
                                        side: upstate.playersList.players!
                                            .toSet()
                                            .difference(players.toSet())
                                            .toList(),
                                        stageId: stageId,
                                      ))
                                    : null,
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: size != 5
                                  ? const Color.fromARGB(255, 209, 200, 200)
                                  : darkMode.darkTheme
                                      ? Colors.white
                                      : Colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                body: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: double.infinity,
                        color: Theme.of(context).colorScheme.secondary,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BlocConsumer<CreditsCubit, CreditsState>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                int total =
                                    context.read<CreditsCubit>().getTotal();
                                if (edit) {}
                                return SizedBox(
                                  child: Text(
                                    "$total/65",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: switch (upstate) {
                        TryGetPlayersState() =>
                          const Center(child: DoubleSpinner()),
                        ResultGetPlayersState() => upstate
                                .playersList.players!.isEmpty
                            ? const Center(
                                child: Text(
                                  "Nessun giocatore disponibile",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            : BlocBuilder<SelectPlayerBloc, SelectPlayerState>(
                                builder: (context, state) {
                                  final List<Player> list =
                                      upstate.playersList.players!;
                                  return Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              PlayerIcon(
                                                players: list,
                                                mContext: context,
                                              ),
                                              PlayerIcon(
                                                players: list,
                                                mContext: context,
                                              ),
                                              PlayerIcon(
                                                players: list,
                                                mContext: context,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: SizedBox(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                PlayerIcon(
                                                  players: list,
                                                  mContext: context,
                                                ),
                                                PlayerIcon(
                                                  players: list,
                                                  mContext: context,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                        _ => const Text("No matching"),
                      }),
                      BlocBuilder<BannerBloc, BannerState>(
                        builder: (context, state) {
                          if (state is TryGetBannerState) {
                            return const SponsorsBannerBlank();
                          } else if (state is ResultBannerListState) {
                            return SponsorsBanner(
                                banner: state.bannerList.banners![0]);
                          } else {
                            return const SponsorsBannerBlank();
                          }
                        },
                      ),
                    ],
                  ),
                ));
          });
        }));
  }
}
