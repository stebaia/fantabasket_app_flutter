import 'dart:convert';

import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:flutter/material.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:flutter/widgets.dart';

class PlayerBar extends StatelessWidget {
  final Player player;
  final bool enabled;

  const PlayerBar({
    required this.player,
    required this.enabled,
    super.key,
  });

  Color _getColor() {
    String? category = player.category;
    print("Giocatore: $player");
    return Constants.categoryColors[category]!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Card(
        color:
            enabled ? Colors.white : const Color.fromARGB(255, 212, 207, 207),
        elevation: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                    width: 80,
                    height: 100,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: player.photo != ''
                            ? Image.network(
                                '${Constants.baseUrl}${player.photo}',
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
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        player.team,
                        style: const TextStyle(
                          color: Colors.black,
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
              decoration: BoxDecoration(
                  color: _getColor(),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
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
      ),
    );
  }
}
