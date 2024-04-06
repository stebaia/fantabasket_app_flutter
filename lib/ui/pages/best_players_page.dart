import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/select_team_bloc/select_team_bloc.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/ui/widgets/best_players_card.dart';
import 'package:fantabasket_app_flutter/ui/widgets/sponsors_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestPlayersPage extends StatelessWidget with AutoRouteWrapper {
  final Stage stage;

  const BestPlayersPage({
    required this.stage,
    super.key,
  });

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<SelectTeamBloc>(
            create: ((context) => SelectTeamBloc(
                playerRepository: context.read(),
                stagesRepository: context.read())
              ..getPlayers(stage.id)),
          )
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 14, 13, 13),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 14, 13, 13),
        title: const Text(
          'Migliori giocatori',
          style: TextStyle(fontSize: 18),
        ),
        automaticallyImplyLeading: true,
      ),
      body: BlocConsumer<SelectTeamBloc, SelectTeamState>(
        listener: (context, state) {},
        builder: (context, state) {
          return switch (state) {
            ErrorGetPlayersState(errorString: var errorString) => Center(
                child: Text(
                  errorString,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            EmptyGetPlayersState() => const Column(
                children: [
                  SponsorsBanner(),
                  Center(
                    child: Text(
                      "Nessun giocatore presente",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            _ => Skeletonizer(
                enabled: state is TryGetPlayersState,
                child: Column(
                  children: [
                    const SponsorsBanner(),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              switch (state) {
                                TryGetPlayersState() => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ResultGetPlayersState(
                                  playersList: var players
                                ) =>
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: players.count,
                                    itemBuilder: (context, index) =>
                                        BestPlayersCard(
                                            player: players.players![index]),
                                  ),
                                _ => ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 4,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return const BestPlayersCard(
                                        player: Player(
                                          id: 0,
                                          category: "",
                                          email: "",
                                          firstName: "",
                                          lastName: "",
                                          phone: "",
                                          photo: "",
                                          team: "",
                                          value: 0,
                                        ),
                                      );
                                    },
                                  ),
                              }
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          };
        },
      ),
    );
  }
}
