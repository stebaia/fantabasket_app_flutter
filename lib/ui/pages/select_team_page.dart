import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/credits_cubit/credits_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/select_team_bloc/select_team_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/select_player_bloc/select_player_bloc.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:fantabasket_app_flutter/ui/widgets/player_bar.dart';
import 'package:fantabasket_app_flutter/ui/widgets/player_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
              ..getPlayers()),
          ),
          BlocProvider<SelectPlayerBloc>(
            create: ((context) => SelectPlayerBloc()),
          ),
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    late List<Player> allPlayers;
    print("Stage 2: $stage");
    return PopScope(
      onPopInvoked: (value) => context.read<CreditsCubit>().resetTotal(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                context.router
                    .popUntil((route) => route.settings.name == CoreRoute.name);
              },
              icon: const Icon(Icons.close),
            )
          ],
          automaticallyImplyLeading: true,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 225, 135, 57),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      BlocConsumer<CreditsCubit, CreditsState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          print("Rebuild, state: $state");
                          int total = context.read<CreditsCubit>().getTotal();
                          return SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
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
                              onTap: () => size == 5
                                  ? context.router.push(CompletionRoute(
                                      team: players,
                                      side: allPlayers
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
                ),
              ),
              Expanded(
                flex: 4,
                child: BlocConsumer<SelectPlayerBloc, SelectPlayerState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      var players =
                          context.read<SelectPlayerBloc>().getCheckedPlayers();
                      var size = players.length;
                      return Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  PlayerIcon(
                                    player: size >= 1 ? players[0] : null,
                                  ),
                                  PlayerIcon(
                                    player: size >= 2 ? players[1] : null,
                                  ),
                                  PlayerIcon(
                                    player: size >= 3 ? players[2] : null,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    PlayerIcon(
                                      player: size >= 4 ? players[3] : null,
                                    ),
                                    PlayerIcon(
                                      player: size >= 5 ? players[4] : null,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              Expanded(
                  flex: 5,
                  child: BlocConsumer<SelectTeamBloc, SelectTeamState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  color:
                                      const Color.fromARGB(255, 225, 135, 57),
                                  child: const Row(
                                    children: [
                                      Expanded(
                                        flex: 8,
                                        child: Text(
                                          "Lista giocatori",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Icon(
                                          Icons.filter_list_outlined,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: state is ResultGetPlayersState
                                    ? state.playersList.players!.isEmpty
                                        ? const Text(
                                            "Nessun giocatore disponibile")
                                        : BlocConsumer<SelectPlayerBloc,
                                                SelectPlayerState>(
                                            listener:
                                                (cubitContext, cubitState) {},
                                            builder:
                                                (cubitContext, cubitState) {
                                              allPlayers =
                                                  state.playersList.players!;
                                              var checked = cubitState.props
                                                  as List<Player>;
                                              var totalSize = allPlayers.length;
                                              var checkedSize = checked.length;
                                              final List<Player> list =
                                                  List.from(Set.from(allPlayers)
                                                      .difference(
                                                          Set.from(checked)));
                                              return ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    totalSize - checkedSize,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      int total = context
                                                          .read<CreditsCubit>()
                                                          .getTotal();
                                                      int value =
                                                          list[index].value;
                                                      if (checkedSize < 5 &&
                                                          total + value <= 65) {
                                                        context
                                                            .read<
                                                                CreditsCubit>()
                                                            .increment(value);
                                                        context
                                                            .read<
                                                                SelectPlayerBloc>()
                                                            .addPlayer(
                                                                list[index]);
                                                      }
                                                    },
                                                    child: PlayerBar(
                                                      player: list[index],
                                                    ),
                                                  );
                                                },
                                              );
                                            })
                                    : ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: 10,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Skeletonizer(
                                            containersColor: Colors.white,
                                            enabled:
                                                state is TryGetPlayersState,
                                            child: const PlayerBar(
                                              player: Player(
                                                  id: 0,
                                                  firstName: '',
                                                  lastName: '',
                                                  phone: '',
                                                  value: 0,
                                                  team: '',
                                                  category: '',
                                                  email: ''),
                                            ),
                                          );
                                        },
                                      ),
                              ),
                            ],
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
