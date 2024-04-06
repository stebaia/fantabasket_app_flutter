import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/credits_cubit/credits_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/select_team_bloc/select_team_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/select_player_bloc/select_player_bloc.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:fantabasket_app_flutter/ui/widgets/player_icon.dart';
import 'package:fantabasket_app_flutter/ui/widgets/sponsors_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectTeamPage extends StatelessWidget with AutoRouteWrapper {
  final Stage stage;

  const SelectTeamPage({
    super.key,
    required this.stage,
  });

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<SelectTeamBloc>(
            create: ((context) => SelectTeamBloc(
                stagesRepository: context.read(),
                playerRepository: context.read())
              ..getPlayers(stage.id)),
          ),
          BlocProvider<CreditsCubit>(
            create: ((context) => CreditsCubit(context: context)),
          ),
          BlocProvider<SelectPlayerBloc>(
            create: ((context) => SelectPlayerBloc()),
          ),
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return PopScope(
        onPopInvoked: (value) => context.read<CreditsCubit>().resetTotal(),
        child: BlocConsumer<SelectTeamBloc, SelectTeamState>(
            listener: (context, upstate) {},
            builder: (context, upstate) {
              return Scaffold(
                  backgroundColor: Color.fromARGB(255, 14, 13, 13),
                  appBar: AppBar(
                    foregroundColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 14, 13, 13),
                    title: const Text(
                      'Scegli i giocatori',
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
                                          stage: stage,
                                        ))
                                      : null,
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: size == 5
                                    ? Colors.white
                                    : const Color.fromARGB(255, 209, 200, 200),
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
                          color: const Color.fromARGB(255, 225, 135, 57),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              BlocConsumer<CreditsCubit, CreditsState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  print("Rebuild total: $state");
                                  int total =
                                      context.read<CreditsCubit>().getTotal();
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
                            const Center(child: CircularProgressIndicator()),
                          ResultGetPlayersState() => upstate
                                  .playersList.players!.isEmpty
                              ? const Center(
                                  child: Text(
                                    "Nessun giocatore disponibile",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              : BlocConsumer<SelectPlayerBloc,
                                  SelectPlayerState>(
                                  listener: (context, state) {},
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
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
                        const SponsorsBanner(),
                      ],
                    ),
                  ));
            }));
  }
}
