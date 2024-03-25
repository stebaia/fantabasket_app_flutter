import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/team_detail_bloc/team_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamDetailPage extends StatelessWidget with AutoRouteWrapper {
  const TeamDetailPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<TeamDetailBloc>(
            create: ((context) => TeamDetailBloc()..getTeamDetail()),
          ),
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 14, 13, 13),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 14, 13, 13),
        title: const Text(
          "Dettaglio squadra",
          style: TextStyle(fontSize: 18),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Text(
              "Team A",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 225, 135, 57),
                fontSize: 25,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<TeamDetailBloc, TeamDetailState>(
                builder: (BuildContext context, TeamDetailState state) {
              return switch (state) {
                TryTeamDetailState() => const Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  )),
                ResultTeamDetailState() => ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.players.length,
                    itemBuilder: (context, index) {
                      final player = state.players[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        child: Card(
                          child: Text(player.lastName + player.firstName),
                        ),
                        //child: RankDetailCard(player: state.players[index]),
                      );
                    },
                  ),
                _ => Container(),
              };
            }),
          )
        ],
      ),
    );
  }
}
