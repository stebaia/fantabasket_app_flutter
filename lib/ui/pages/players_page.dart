import 'package:fantabasket_app_flutter/bloc/all_players_bloc/all_players_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/banner_bloc/banner_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/select_team_bloc/select_team_bloc.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/ui/widgets/double_spinner.dart';
import 'package:fantabasket_app_flutter/ui/widgets/sponsors_banner.dart';
import 'package:fantabasket_app_flutter/ui/widgets/tab_general.dart';
import 'package:fantabasket_app_flutter/ui/widgets/tab_stages.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/create_team_bloc/create_team_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

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
                    SponsorsBanner(banner: state.bannerList.banners![0]),
                  _ => const SponsorsBannerBlank(),
                };
              },
            ),
            const SizedBox(height: 10),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Text(
                "Giocatori",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: darkMode.darkTheme ? Colors.white : Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TabBar(
              labelColor: Theme.of(context).colorScheme.secondary,
              indicatorColor: Theme.of(context).colorScheme.tertiary,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(text: "Tappe"),
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
                      ErrorGetStagesState() => const Center(
                          child: Text("Errore nel caricamento delle tappe"),
                        ),
                      EmptyGetStagesState() => const Center(
                          child: Text("Nessuna tappa presente"),
                        ),
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
