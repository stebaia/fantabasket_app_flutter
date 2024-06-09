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
  final bool status;

  const RankDetailCard({
    required this.player,
    required this.position,
    required this.owner,
    required this.status,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);
    return GestureDetector(
      onTap: () {
        if (!status || owner) {
          context.router.push(TeamDetailRoute(
            teamId: player.id,
            teamName: player.teamName!,
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Hey! non sbirciare! ancora la tappa non è aperta!'),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: ListTile(
        title: Text(
          player.teamName ?? "Nome non disponibile",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito Sans',
              fontSize: 18,
              color: darkMode.darkTheme ? Colors.white : Colors.black),
        ),
        subtitle: Text('Punti totali: ${player.points}'),
        leading: SizedBox(
          width: 50,
          height: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              player.photo ??
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/LeBron_James_%2851959977144%29_%28cropped2%29.jpg/640px-LeBron_James_%2851959977144%29_%28cropped2%29.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        trailing: Container(
          height: 40,
          width: 40,
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
          child: Text(
            "$position°",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
