import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/banner_bloc/banner_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/credits_cubit/credits_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/player_detail_bloc/player_detail_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/select_team_bloc/select_team_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/select_player_bloc/select_player_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/team_detail_bloc/team_detail_bloc.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/model/team.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:fantabasket_app_flutter/ui/components/empty_component.dart';
import 'package:fantabasket_app_flutter/ui/widgets/double_spinner.dart';
import 'package:fantabasket_app_flutter/ui/widgets/player_icon.dart';
import 'package:fantabasket_app_flutter/ui/widgets/sponsors_banner.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:fantabasket_app_flutter/utils/styles.dart';
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
                  ..getTeamDetail(team!.id);
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
        child: BlocBuilder<SelectTeamBloc, SelectTeamState>(
            builder: (context, upstate) {
          return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.primary,
              appBar: AppBar(
                foregroundColor:
                    darkMode.darkTheme ? Colors.white : Colors.black,
                backgroundColor: Theme.of(context).colorScheme.primary,
                title: const Text(
                  'Scegli il tuo quintetto',
                  style: TextStyle(fontSize: 18),
                ),
                automaticallyImplyLeading: true,
                actions: [
                  BlocBuilder<SelectPlayerBloc, SelectPlayerState>(
                    builder: (context, state) {
                      var players =
                          context.read<SelectPlayerBloc>().getCheckedPlayers();
                      var size = players.length;
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: GestureDetector(
                          onTap: () => edit
                              ? context.router.push(CompletionRoute(
                                  players: players,
                                  side: context
                                      .read<SelectTeamBloc>()
                                      .players
                                      .players!
                                      .toSet()
                                      .difference(players.toSet())
                                      .toList(),
                                  stageId: stageId,
                                  team: team,
                                ))
                              : upstate is ResultGetPlayersState && size == 5
                                  ? context.router.push(CompletionRoute(
                                      players: players,
                                      side: upstate.playersList.players!
                                          .toSet()
                                          .difference(players.toSet())
                                          .toList(),
                                      stageId: stageId,
                                      team: team,
                                    ))
                                  : null,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: size != 5 && !edit
                                ? const Color.fromARGB(255, 209, 200, 200)
                                : darkMode.darkTheme
                                    ? Styles.darkMode(true, context)
                                        .colorScheme
                                        .tertiary
                                    : Styles.lightMode(true, context)
                                        .colorScheme
                                        .tertiary,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              body: BlocBuilder<TeamDetailBloc, TeamDetailState>(
                  builder: (context, detailState) {
                if (!edit) {
                  return SizedBox(
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
                              BlocBuilder<CreditsCubit, CreditsState>(
                                builder: (context, state) {
                                  int total =
                                      context.read<CreditsCubit>().getTotal();
                                  return SizedBox(
                                    child: Text(
                                      "Fanta Coins: $total/65",
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
                                  child: EmptyComponent(
                                      text: "Non ci sono giocatori"))
                              : BlocBuilder<SelectPlayerBloc,
                                  SelectPlayerState>(
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
                                                  selected: null,
                                                ),
                                                PlayerIcon(
                                                  players: list,
                                                  mContext: context,
                                                  selected: null,
                                                ),
                                                PlayerIcon(
                                                  players: list,
                                                  mContext: context,
                                                  selected: null,
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  PlayerIcon(
                                                    players: list,
                                                    mContext: context,
                                                    selected: null,
                                                  ),
                                                  PlayerIcon(
                                                    players: list,
                                                    mContext: context,
                                                    selected: null,
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
                          _ => const EmptyComponent(
                              text: 'Nessun giocatore presente nella tappa')
                        }),
                        BlocBuilder<BannerBloc, BannerState>(
                          builder: (context, state) {
                            if (state is TryGetBannerState) {
                              return const SponsorsBannerBlank();
                            } else if (state is ResultBannerListState) {
                              return SponsorsBanner(banner: state.bannerModel);
                            } else {
                              return const SponsorsBannerBlank();
                            }
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  return switch (detailState) {
                    TryTeamDetailState() => const DoubleSpinner(),
                    ResultTeamDetailState(teamDetail: var td) => SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: double.infinity,
                              color: Theme.of(context).colorScheme.secondary,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  BlocBuilder<CreditsCubit, CreditsState>(
                                    builder: (context, state) {
                                      int total = context
                                          .read<CreditsCubit>()
                                          .getTotal();
                                      return SizedBox(
                                        child: Text(
                                          "Fanta Coins: $total/65",
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
                                  : BlocBuilder<SelectPlayerBloc,
                                      SelectPlayerState>(
                                      builder: (context, state) {
                                        final List<Player> list =
                                            upstate.playersList.players!;
                                        var plsSint = td.days.first.players;
                                        var pls = plsSint
                                            .map((p) => Player(
                                                  id: p.id,
                                                  firstName: p.firstName,
                                                  lastName: p.lastName,
                                                  value: p.total,
                                                  team: "",
                                                  photo: p.photo,
                                                  phone: "",
                                                  category: p.category,
                                                  email: "",
                                                  points: null,
                                                ))
                                            .toList();
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
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    PlayerIcon(
                                                      players: list,
                                                      mContext: context,
                                                      selected: pls[0],
                                                    ),
                                                    PlayerIcon(
                                                      players: list,
                                                      mContext: context,
                                                      selected: pls[1],
                                                    ),
                                                    PlayerIcon(
                                                      players: list,
                                                      mContext: context,
                                                      selected: pls[2],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      PlayerIcon(
                                                        players: list,
                                                        mContext: context,
                                                        selected: pls[3],
                                                      ),
                                                      PlayerIcon(
                                                        players: list,
                                                        mContext: context,
                                                        selected: pls[4],
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
                                      banner: state.bannerModel);
                                } else {
                                  return const SponsorsBannerBlank();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    _ => Container(),
                  };
                }
              }));
        }));
  }
}
