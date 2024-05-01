import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:flutter/material.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:provider/provider.dart';

class PlayerBar extends StatelessWidget {
  final Player player;
  final bool enabled;
  final Player? sixth;

  const PlayerBar({
    required this.player,
    required this.enabled,
    this.sixth,
    super.key,
  });

  Color _getColor() {
    String? category = player.category;
    print("Giocatore: $player");
    return Constants.categoryColors[category]!;
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);

    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: sixth == null
                ? Colors.white
                : Theme.of(context).colorScheme.background,
            width: sixth == null ? 0 : 3,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    foregroundDecoration: enabled
                        ? null
                        : const BoxDecoration(
                            color: Colors.grey,
                            backgroundBlendMode: BlendMode.saturation,
                          ),
                    width: 80,
                    height: 100,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: player.photo != ''
                            ? Image.network(
                                player.photo,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/LeBron_James_%2851959977144%29_%28cropped2%29.jpg/640px-LeBron_James_%2851959977144%29_%28cropped2%29.jpg',
                                fit: BoxFit.cover))),
                Container(
                  foregroundDecoration: enabled
                      ? null
                      : const BoxDecoration(
                          color: Colors.grey,
                          backgroundBlendMode: BlendMode.saturation,
                        ),
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
                          color:
                              darkMode.darkTheme ? Colors.white : Colors.black,
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
              foregroundDecoration: enabled
                  ? null
                  : const BoxDecoration(
                      color: Colors.grey,
                      backgroundBlendMode: BlendMode.saturation,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
              decoration: BoxDecoration(
                color: _getColor(),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Center(
                  child: Text(
                Constants.categoryValues[player.category].toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
            )
          ],
        ),
      ),
    );
  }
}
