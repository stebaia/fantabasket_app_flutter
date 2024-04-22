import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/player_in_rank.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RankDetailCard extends StatelessWidget {
  final PlayerInRank player;
  const RankDetailCard({
    required this.player,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      color: Theme.of(context).colorScheme.primary,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 30,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      player.teamName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito Sans',
                          fontSize: 18,
                          color:
                              darkMode.darkTheme ? Colors.white : Colors.black),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "${player.lastName} ${player.firstName}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Nunito Sans',
                          color:
                              darkMode.darkTheme ? Colors.white : Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(flex: 10, child: SizedBox()),
            Expanded(
              flex: 15,
              child: Container(
                decoration: BoxDecoration(
                  color: switch (player.position) {
                    1 => const Color.fromARGB(255, 255, 215, 0),
                    2 => const Color.fromARGB(255, 192, 192, 192),
                    3 => const Color.fromARGB(255, 176, 141, 87),
                    _ => Colors.white,
                  },
                  border: Border.all(
                      color: const Color.fromARGB(255, 212, 204, 204)),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text("${player.position}°"),
              ),
            ),
            Expanded(
              flex: 15,
              child: Text(
                "${player.points}",
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Nunito Sans',
                    color: darkMode.darkTheme ? Colors.white : Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
