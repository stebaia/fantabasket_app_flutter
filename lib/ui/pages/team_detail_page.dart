import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/team_detail_bloc/team_detail_bloc.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/team_detail.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:fantabasket_app_flutter/ui/widgets/double_spinner.dart';
import 'package:fantabasket_app_flutter/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class TeamDetailPage extends StatelessWidget with AutoRouteWrapper {
  final int teamId;
  final String teamName;

  const TeamDetailPage({
    required this.teamId,
    required this.teamName,
    super.key,
  });

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<TeamDetailBloc>(
            create: ((context) => TeamDetailBloc(teamRepository: context.read())
              ..getTeamDetail(teamId)),
          ),
        ],
        child: this,
      );

  Widget _getPlayerCard(
    BuildContext context,
    TeamDetail td,
    int position,
    String currentDay,
    bool darkMode,
  ) {
    var entry = td.days
        .where((day) => day.day == currentDay)
        .first
        .players
        .elementAt(position);
    print(position);
    return GestureDetector(
      onTap: () => context.router.push(
        PlayerDetailRoute(
          id: entry.id,
          firstName: entry.firstName,
          lastName: entry.lastName,
          photo: entry.photo,
          category: entry.category,
        ),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.32,
        //height: MediaQuery.of(context).size.height * 0.26,
        child: Card(
          color: Theme.of(context).colorScheme.primary,
          elevation: 4,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.32,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    position == 5 ? "Sesto uomo" : "Giocatore ${position + 1}",
                    style: TextStyle(
                      color: darkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.32,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: entry.photo != ''
                            ? Image.network(
                                entry.photo,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/LeBron_James_%2851959977144%29_%28cropped2%29.jpg/640px-LeBron_James_%2851959977144%29_%28cropped2%29.jpg',
                                fit: BoxFit.cover))),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    //height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        color: ColorUtils.getColor(entry.category),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          entry.firstName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          entry.lastName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Punti: ${entry.total}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
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
          "Dettagli squadra",
          style: TextStyle(fontSize: 18),
        ),
        automaticallyImplyLeading: true,
      ),
      body: BlocBuilder<TeamDetailBloc, TeamDetailState>(
          builder: (BuildContext context, TeamDetailState state) {
        final String currentDay =
            context.read<TeamDetailBloc>().getCurrentDay();
        print("State is: $state");
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Text(
                teamName,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: darkMode.darkTheme ? Colors.white : Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(height: 5),
            switch (state) {
              TryTeamDetailState() => Container(),
              ResultTeamDetailState(teamDetail: var td) ||
              ResultUpdateDayState(teamDetail: var td) ||
              TryUpdateDayState(teamDetail: var td) =>
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                  child: Text(
                    "Punti totali: ${td.totalPoints}",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: darkMode.darkTheme ? Colors.white : Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              _ => Container(),
            },
            const SizedBox(height: 20),
            switch (state) {
              TryTeamDetailState() => Container(),
              ResultTeamDetailState(teamDetail: var td) ||
              ResultUpdateDayState(teamDetail: var td) ||
              TryUpdateDayState(teamDetail: var td) =>
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  child: Row(
                    children: [
                      ...td.days.map((matchDay) => GestureDetector(
                            onTap: () => context
                                .read<TeamDetailBloc>()
                                .updateDay(matchDay.day),
                            child: SizedBox(
                              height: 80,
                              child: Card(
                                color: matchDay.day ==
                                        context
                                            .read<TeamDetailBloc>()
                                            .getCurrentDay()
                                    ? Theme.of(context).colorScheme.background
                                    : Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: matchDay.day ==
                                            context
                                                .read<TeamDetailBloc>()
                                                .getCurrentDay()
                                        ? Theme.of(context)
                                            .colorScheme
                                            .background
                                        : Colors.white,
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: Container(
                                  constraints: const BoxConstraints(
                                    minWidth: 120,
                                    maxWidth: 120,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        matchDay.day,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Punti: ${matchDay.points}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
                TryTeamDetailState() ||
                TryUpdateDayState() =>
                  const Center(child: DoubleSpinner()),
                ResultTeamDetailState(teamDetail: var td) ||
                ResultUpdateDayState(teamDetail: var td) =>
                  td.days.isEmpty
                      ? const Center(
                          child: Text("Nessuna giornata caricata"),
                        )
                      : Container(
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
                                    _getPlayerCard(context, td, 0, currentDay,
                                        darkMode.darkTheme),
                                    _getPlayerCard(context, td, 1, currentDay,
                                        darkMode.darkTheme),
                                    _getPlayerCard(context, td, 2, currentDay,
                                        darkMode.darkTheme),
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
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      _getPlayerCard(context, td, 3, currentDay,
                                          darkMode.darkTheme),
                                      _getPlayerCard(context, td, 4, currentDay,
                                          darkMode.darkTheme),
                                      _getPlayerCard(context, td, 5, currentDay,
                                          darkMode.darkTheme),
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
