import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/player_in_rank.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RankDetailCard extends StatelessWidget {
  final PlayerInRank player;
  final int position;
  final bool owner;

  const RankDetailCard({
    required this.player,
    required this.position,
    required this.owner,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);
    return GestureDetector(
      onTap: () => context.router.push(TeamDetailRoute(
        teamId: player.id,
        teamName: player.teamName!,
      )),
      child: SizedBox(
        height: 80,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          color: owner
              ? const Color.fromARGB(108, 190, 189, 189)
              : Theme.of(context).colorScheme.primary,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  flex: 40,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      player.teamName ?? "Nome non disponibile",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito Sans',
                          fontSize: 18,
                          color:
                              darkMode.darkTheme ? Colors.white : Colors.black),
                    ),
                  ),
                ),
                const Expanded(flex: 5, child: SizedBox()),
                Expanded(
                  flex: 10,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: switch (position) {
                        1 => const Color.fromARGB(255, 255, 215, 0),
                        2 => const Color.fromARGB(255, 192, 192, 192),
                        3 => const Color.fromARGB(255, 176, 141, 87),
                        _ => Colors.white,
                      },
                      border: Border.all(
                        color: const Color.fromARGB(255, 212, 204, 204),
                      ),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text("$position°"),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Text(
                    "${player.points}",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Nunito Sans',
                        color:
                            darkMode.darkTheme ? Colors.white : Colors.black),
                  ),
                ),
                const Expanded(flex: 1, child: SizedBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
