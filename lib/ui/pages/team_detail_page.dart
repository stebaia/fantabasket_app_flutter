import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/team_detail_bloc/team_detail_bloc.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/utils/color_utils.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fantabasket_app_flutter/model/team.dart';

class TeamDetailPage extends StatelessWidget with AutoRouteWrapper {
  final Team team;

  const TeamDetailPage({
    required this.team,
    super.key,
  });

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<TeamDetailBloc>(
            create: ((context) => TeamDetailBloc()..getTeamDetail()),
          ),
        ],
        child: this,
      );

  Widget getPlayerCard(BuildContext context, MapEntry<Player, int> entry) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.32,
      height: MediaQuery.of(context).size.height * 0.26,
      child: Card(
        color: Color.fromARGB(255, 14, 13, 13),
        elevation: 4,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.32,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Column(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.32,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: entry.key.photo != ''
                              ? Image.network(
                                  '${Constants.baseUrl}${entry.key.photo}',
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/LeBron_James_%2851959977144%29_%28cropped2%29.jpg/640px-LeBron_James_%2851959977144%29_%28cropped2%29.jpg',
                                  fit: BoxFit.cover))),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        color: ColorUtils.getColor(entry.key),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          entry.key.firstName,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          entry.key.lastName,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Punti: ${entry.value}",
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 14, 13, 13),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 14, 13, 13),
        title: const Text(
          "Bologna",
          style: TextStyle(fontSize: 18),
        ),
        automaticallyImplyLeading: true,
      ),
      body: BlocBuilder<TeamDetailBloc, TeamDetailState>(
          builder: (BuildContext context, TeamDetailState state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Text(
                team.nome ?? "Nome non disponibile",
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 225, 135, 57),
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(height: 5),
            switch (state) {
              TryTeamDetailState() => Container(),
              ResultTeamDetailState() => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                  child: Text(
                    "Punti totali: ${state.teamDetail.totalPoints}",
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              _ => Container(),
            },
            const SizedBox(height: 20),
            switch (state) {
              TryTeamDetailState() => Container(),
              ResultTeamDetailState() => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Row(
                    children: [
                      ...state.teamDetail.days.map((matchDay) => SizedBox(
                            height: 70,
                            width: 70,
                            child: Card(
                              color: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.white),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "G${matchDay.dayNumber}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "${matchDay.points}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              _ => Container(),
            },
            const SizedBox(height: 10),
            Expanded(
              child: switch (state) {
                TryTeamDetailState() => const Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  )),
                ResultTeamDetailState() => Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              getPlayerCard(
                                context,
                                state.teamDetail.players.entries.elementAt(0),
                              ),
                              getPlayerCard(
                                context,
                                state.teamDetail.players.entries.elementAt(1),
                              ),
                              getPlayerCard(
                                context,
                                state.teamDetail.players.entries.elementAt(2),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                getPlayerCard(
                                  context,
                                  state.teamDetail.players.entries.elementAt(3),
                                ),
                                getPlayerCard(
                                  context,
                                  state.teamDetail.players.entries.elementAt(4),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                _ => Container(),
              },
            )
          ],
        );
      }),
    );
  }
}
