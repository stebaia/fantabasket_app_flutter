import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BestPlayersCard extends StatelessWidget {
  final Player player;

  const BestPlayersCard({
    required this.player,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);
    return GestureDetector(
        onTap: () => context.router.push(PlayerDetailRoute(
              id: player.id,
              firstName: player.firstName,
              lastName: player.lastName,
              photo: player.photo,
              category: player.category,
            )),
        child: Container(
          width: double.infinity,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      width: 80,
                      height: 100,
                      child: ClipRRect(
                          child: player.photo != ''
                              ? Image.network(
                                  player.photo,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/LeBron_James_%2851959977144%29_%28cropped2%29.jpg/640px-LeBron_James_%2851959977144%29_%28cropped2%29.jpg',
                                  fit: BoxFit.cover))),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${player.firstName} ${player.lastName}',
                          style: TextStyle(
                              color: darkMode.darkTheme
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          player.category,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: darkMode.darkTheme
                                ? Colors.white
                                : Colors.black,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                width: 40,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: Center(
                    child: Text(
                  player.value.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
              )
            ],
          ),
        ));
  }
}
