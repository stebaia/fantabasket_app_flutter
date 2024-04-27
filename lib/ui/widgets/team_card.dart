import 'package:auto_route/auto_route.dart';
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
      onTap: () => team.stageStatus!
          ? context.router.push(TeamDetailRoute(team: team))
          : context.router.push(
              SelectTeamRoute(
                stageId: int.parse(team.stageId!),
                team: team,
              ),
            ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: Theme.of(context).colorScheme.primary,
          elevation: 4,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
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
                  team.nome!,
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
                      '120',
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
                Row(
                  children: [
                    Text(
                      'Tappa: ',
                      style: TextStyle(
                        color: darkMode.darkTheme ? Colors.white : Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Bologna',
                      style: TextStyle(
                          color:
                              darkMode.darkTheme ? Colors.white : Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
