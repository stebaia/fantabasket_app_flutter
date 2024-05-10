import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/banner_bloc/banner_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/select_team_bloc/select_team_bloc.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/ui/widgets/best_players_card.dart';
import 'package:fantabasket_app_flutter/ui/widgets/double_spinner.dart';
import 'package:fantabasket_app_flutter/ui/widgets/sponsors_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
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
          ),
          BlocProvider<BannerBloc>(
            create: ((context) =>
                BannerBloc(repository: context.read())..getBannerList()),
          )
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        foregroundColor: darkMode.darkTheme ? Colors.white : Colors.black,
        backgroundColor: Theme.of(context).colorScheme.primary,
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
            EmptyGetPlayersState() => Column(
                children: [
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
                  const Center(
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
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              switch (state) {
                                TryGetPlayersState() => const Center(
                                    child: DoubleSpinner(),
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
