import 'package:fantabasket_app_flutter/bloc/all_players_bloc/all_players_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/banner_bloc/banner_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/select_team_bloc/select_team_bloc.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/ui/components/empty_component.dart';
import 'package:fantabasket_app_flutter/ui/widgets/double_spinner.dart';
import 'package:fantabasket_app_flutter/ui/widgets/sponsors_banner.dart';
import 'package:fantabasket_app_flutter/ui/widgets/tab_general.dart';
import 'package:fantabasket_app_flutter/ui/widgets/tab_stages.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/create_team_bloc/create_team_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class PlayersPage extends StatelessWidget with AutoRouteWrapper {
  const PlayersPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<CreateTeamBloc>(
            create: ((context) =>
                CreateTeamBloc(stagesRepository: context.read())..getStages()),
          ),
          BlocProvider<BannerBloc>(
            create: ((context) =>
                BannerBloc(repository: context.read())..getBannerList()),
          ),
          BlocProvider<AllPlayersBloc>(
            create: ((context) =>
                AllPlayersBloc(playerRepository: context.read())
                  ..getAllPlayers()),
          ),
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);

    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<BannerBloc, BannerState>(
              builder: (context, state) {
                return switch (state) {
                  TryGetBannerState() => const SponsorsBannerBlank(),
                  ResultBannerListState() =>
                    SponsorsBanner(banner: state.bannerModel),
                  _ => const SponsorsBannerBlank(),
                };
              },
            ),
            const SizedBox(height: 10),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Row(
                children: [
                  Lottie.asset('assets/lottie/empty.json',
                      width: 60, height: 60),
                  Text(
                    "Players",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: darkMode.darkTheme ? Colors.white : Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            TabBar(
              labelColor: Theme.of(context).colorScheme.tertiary,
              indicatorColor: Theme.of(context).colorScheme.tertiary,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(
                  text: "Tappe",
                ),
                Tab(text: "Generale"),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                children: [
                  BlocBuilder<CreateTeamBloc, CreateTeamState>(
                      builder: (context, state) {
                    return switch (state) {
                      TryGetStagesState() => const Center(
                          child: DoubleSpinner(),
                        ),
                      ResultGetStagesState(stagesList: var list) => TabStages(
                          darkMode: darkMode,
                          list: list,
                        ),
                      ErrorGetStagesState() => EmptyComponent(
                          text: "Al momento non ci sono tappe...",
                        ),
                      EmptyGetStagesState() => EmptyComponent(
                          text:
                              "Nessuna tappa presente, attendi che vengano caricate dal nostro team!"),
                      _ => Container()
                    };
                  }),
                  BlocBuilder<AllPlayersBloc, AllPlayersState>(
                      builder: (context, state) {
                    return switch (state) {
                      TryAllPlayersState() => const Center(
                          child: DoubleSpinner(),
                        ),
                      ResultAllPlayersState(playersList: var list) =>
                        TabGeneral(
                          darkMode: darkMode,
                          list: list,
                        ),
                      ErrorAllPlayersState() => const Center(
                          child: Text("Errore nel caricamento dei giocatori"),
                        ),
                      EmptyAllPlayersState() => const Center(
                          child: Text("Nessun giocatore presente"),
                        ),
                      _ => Container(),
                    };
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
