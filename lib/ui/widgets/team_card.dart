import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/view_team_bloc/view_team_bloc.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/team.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeamCard extends StatelessWidget {
  final Team team;

  const TeamCard({
    required this.team,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);

    return GestureDetector(
      onTap: () => team.stageStatus != "Aperta"
          ? context.pushRoute(TeamDetailRoute(
              teamId: team.id,
              teamName: team.teamName!,
            ))
          : context
              .pushRoute(
                SelectTeamRoute(
                  stageId: team.stageId!,
                  team: team,
                ),
              )
              .then((value) => context.read<ViewTeamBloc>().viewMyTeams()),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: Theme.of(context).colorScheme.primary,
          elevation: 4,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  width: 36,
                  height: 36,
                  image: const AssetImage('assets/images/basketballicon.png'),
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  team.teamName!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: darkMode.darkTheme ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      'Punti guadagnati: ',
                      style: TextStyle(
                        color: darkMode.darkTheme ? Colors.white : Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      team.points!.toString(),
                      style: TextStyle(
                          color:
                              darkMode.darkTheme ? Colors.white : Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Tappa:',
                  style: TextStyle(
                    color: darkMode.darkTheme ? Colors.white : Colors.black,
                    fontSize: 18,
                  ),
                ),
                Text(
                  team.stageName!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: darkMode.darkTheme ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
