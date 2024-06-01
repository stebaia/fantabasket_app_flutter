import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/banner_bloc/banner_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/select_team_bloc/select_team_bloc.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:fantabasket_app_flutter/ui/components/empty_component.dart';
import 'package:fantabasket_app_flutter/ui/widgets/best_players_card.dart';
import 'package:fantabasket_app_flutter/ui/widgets/double_spinner.dart';
import 'package:fantabasket_app_flutter/ui/widgets/sponsors_banner.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
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

  Color getTransparentColor(Color color, double opacity) {
    return color.withOpacity(opacity);
  }

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
      body: BlocBuilder<SelectTeamBloc, SelectTeamState>(
        builder: (context, state) {
          return switch (state) {
            ErrorGetPlayersState(errorString: var errorString) =>
              const EmptyComponent(
                text: "Al momento non ci sono giocatori...",
              ),
            EmptyGetPlayersState() => Column(
                children: [
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
                  const Expanded(
                    child: Center(
                      child: EmptyComponent(text: "Nessun giocatore presente"),
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
                          return SponsorsBanner(banner: state.bannerModel);
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
                                  ListView.separated(
                                      padding: EdgeInsets.zero,
                                      separatorBuilder: (context, index) =>
                                          const Divider(),
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: players.count,
                                      itemBuilder: (context, index) => ListTile(
                                            onTap: () => context.pushRoute(
                                              PlayerDetailRoute(
                                                id: players.players![index].id,
                                                firstName: players
                                                    .players![index].firstName,
                                                lastName: players
                                                    .players![index].lastName,
                                                photo: players
                                                    .players![index].photo,
                                                category: players
                                                    .players![index].category,
                                              ),
                                            ),
                                            trailing: Container(
                                              width: 60,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color:
                                                          const Color.fromARGB(
                                                              137,
                                                              158,
                                                              158,
                                                              158)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: Center(
                                                child: Text(
                                                  players.players![index].value
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: darkMode.darkTheme
                                                        ? Colors.white
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            visualDensity: const VisualDensity(
                                                horizontal: 0, vertical: 0),
                                            leading: Container(
                                                width: 60,
                                                height: 80,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    players
                                                        .players![index].photo,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )),
                                            dense: true,
                                            title: Text(
                                              '${players.players![index].firstName} ${players.players![index].lastName}',
                                              style: TextStyle(
                                                  color: darkMode.darkTheme
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Row(
                                              children: [
                                                SizedBox(
                                                    child: Container(
                                                  height: 30,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2),
                                                      color: getTransparentColor(
                                                          Constants
                                                                  .categoryColors[
                                                              players
                                                                  .players![
                                                                      index]
                                                                  .category]!,
                                                          0.4)),
                                                  child: Center(
                                                      child: Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    players.players![index]
                                                        .category,
                                                    style: TextStyle(
                                                        color: Constants
                                                                .categoryColors[
                                                            players
                                                                .players![index]
                                                                .category],
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                )),
                                              ],
                                            ),
                                          )),
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
                                          points: null,
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
