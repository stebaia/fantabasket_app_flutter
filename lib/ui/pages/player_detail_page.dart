import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/banner_bloc/banner_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/player_detail_bloc/player_detail_bloc.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/player_stats.dart';
import 'package:fantabasket_app_flutter/ui/widgets/double_spinner.dart';
import 'package:fantabasket_app_flutter/ui/widgets/player_stages_carousel.dart';
import 'package:fantabasket_app_flutter/ui/widgets/sponsors_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlayerDetailPage extends StatelessWidget with AutoRouteWrapper {
  final int id;
  final String firstName;
  final String lastName;
  final String photo;
  final String category;

  const PlayerDetailPage({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.photo,
    required this.category,
    super.key,
  });

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<PlayerDetailBloc>(
            create: ((context) =>
                PlayerDetailBloc(playerRepository: context.read())
                  ..getPlayerDetail(id)),
          ),
          BlocProvider<BannerBloc>(
            create: ((context) =>
                BannerBloc(repository: context.read())..getBannerList()),
          ),
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(
            '$firstName $lastName',
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: true,
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: BlocBuilder<PlayerDetailBloc, PlayerDetailState>(
                builder: (context, state) {
                  if (state is TryPlayerDetailState) {
                    return const Center(
                      child: DoubleSpinner(),
                    );
                  } else if (state is ResultPlayerDetailState) {
                    List<PlayerStats> playerStatsList = [];
                    for (final stats in state.playerStatsList.stages!) {
                      playerStatsList.add(stats.playerStats);
                    }
                    PlayerStats playerStatsSum = PlayerStats(
                      puntoRealizzato: 0,
                      assist: 0,
                      stoppata: 0,
                      rimbalzo: 0,
                      schiacciata: 0,
                      ankleBreaker: 0,
                      abbigliamentoIgnorante: 0,
                    );
                    for (final stats in playerStatsList) {
                      playerStatsSum.add(stats);
                    }
                    return SingleChildScrollView(
                      child: Stack(
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40)),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: size.height * 0.01),
                                      Container(
                                        width: 120,
                                        height: 110,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.network(
                                            photo,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: size.height * 0.03),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      margin: EdgeInsets.all(8),
                                      height: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: darkMode.darkTheme
                                                  ? Colors.white70
                                                  : Color.fromARGB(
                                                      197, 208, 203, 203))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.layerGroup,
                                            color: darkMode.darkTheme
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            category,
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: darkMode.darkTheme
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            'Categoria',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: darkMode.darkTheme
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                    Expanded(
                                        child: Container(
                                      margin: EdgeInsets.all(8),
                                      padding: EdgeInsets.all(4),
                                      height: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: darkMode.darkTheme
                                                  ? Colors.white70
                                                  : Color.fromARGB(
                                                      197, 208, 203, 203))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.peopleGroup,
                                            color: darkMode.darkTheme
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            state.playerStatsList.stages!.first
                                                    .team ??
                                                "Squadra non disponibile...",
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                overflow: TextOverflow.ellipsis,
                                                color: darkMode.darkTheme
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            'Squadra',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: darkMode.darkTheme
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                    Expanded(
                                        child: Container(
                                      margin: EdgeInsets.all(8),
                                      height: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: darkMode.darkTheme
                                                  ? Colors.white70
                                                  : Color.fromARGB(
                                                      197, 208, 203, 203))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.basketball,
                                            color: darkMode.darkTheme
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            state.playerStatsList.stages == null
                                                ? "0"
                                                : state.playerStatsList.stages!
                                                    .map((s) => s.points)
                                                    .reduce((value, element) =>
                                                        value + element)
                                                    .toString(),
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: darkMode.darkTheme
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            'Punti totali',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: darkMode.darkTheme
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Container(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Statistiche',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            GestureDetector(
                                              onTap: () => showModalBottomSheet(
                                                isScrollControlled: true,
                                                context: context,
                                                builder: (context) => Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.75,
                                                  child: PlayerStagesCarousel(
                                                      playerDetail: state
                                                          .playerStatsList),
                                                ),
                                              ),
                                              child: const Row(
                                                children: [
                                                  Text(
                                                    'dettagli',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Icon(
                                                    FontAwesomeIcons.arrowUp,
                                                    size: 12,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Container(
                                              padding: const EdgeInsets.all(4),
                                              height: 100,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: darkMode.darkTheme
                                                          ? Colors.white70
                                                          : Color.fromARGB(197,
                                                              208, 203, 203))),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'punti',
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(playerStatsSum
                                                      .puntoRealizzato
                                                      .toString()),
                                                ],
                                              ),
                                            )),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Expanded(
                                                child: Container(
                                              padding: const EdgeInsets.all(4),
                                              height: 100,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: darkMode.darkTheme
                                                          ? Colors.white70
                                                          : Color.fromARGB(197,
                                                              208, 203, 203))),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'assist',
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text((playerStatsSum.assist! /
                                                          2)
                                                      .round()
                                                      .toString()),
                                                ],
                                              ),
                                            )),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Container(
                                              padding: const EdgeInsets.all(4),
                                              height: 100,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: darkMode.darkTheme
                                                          ? Colors.white70
                                                          : Color.fromARGB(197,
                                                              208, 203, 203))),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'stoppate',
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text((playerStatsSum
                                                              .stoppata! /
                                                          5)
                                                      .round()
                                                      .toString()),
                                                ],
                                              ),
                                            )),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            Expanded(
                                                child: Container(
                                              height: 100,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: darkMode.darkTheme
                                                          ? Colors.white70
                                                          : Color.fromARGB(197,
                                                              208, 203, 203))),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'rimbalzi',
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text((playerStatsSum
                                                              .rimbalzo! /
                                                          3)
                                                      .round()
                                                      .toString()),
                                                ],
                                              ),
                                            ))
                                          ],
                                        )
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (state is ErrorPlayerDetailState) {
                    return Center(
                      child: Text(state.errorString),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            Positioned(
              bottom: 0,
              child: BlocBuilder<BannerBloc, BannerState>(
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
            )
          ],
        ));
  }
}
