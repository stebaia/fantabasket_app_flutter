import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/players_list.dart';
import 'package:fantabasket_app_flutter/ui/widgets/player_bar.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

class PlayerIcon extends StatefulWidget {
  final Player? player;
  final PlayersList players;

  const PlayerIcon({
    required this.player,
    required this.players,
    super.key,
  });

  @override
  State<PlayerIcon> createState() => _PlayerIconState();
}

class _PlayerIconState extends State<PlayerIcon> {
  late Player? selected;

  @override
  void initState() {
    super.initState();
    selected = widget.player;
  }

  @override
  Widget build(BuildContext context) {
    print("Rebuild player icon");
    var height = MediaQuery.of(context).size.height * 0.7;
    return GestureDetector(
      onTap: () async {
        var selectedPlayer = await showModalBottomSheet<Player>(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              height: height,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...widget.players.players!.map(
                        (player) => GestureDetector(
                          onTap: () => Navigator.of(context).pop(player),
                          child: PlayerBar(
                            player: player,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
        setState(() {
          print("Dentro set state");
          selected = selectedPlayer;
        });
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected == null
                    ? Colors.white
                    : Constants.categoryColors[selected!.category],
                border: const Border.symmetric(
                  horizontal:
                      BorderSide(color: Color.fromARGB(255, 201, 195, 195)),
                  vertical:
                      BorderSide(color: Color.fromARGB(255, 201, 195, 195)),
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.17,
              height: MediaQuery.of(context).size.width * 0.17,
              child: Icon(
                Icons.person,
                size: MediaQuery.of(context).size.width * 0.13,
                color: selected == null
                    ? const Color.fromARGB(255, 201, 195, 195)
                    : Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              selected == null
                  ? "Seleziona giocatore\n"
                  : "${selected!.firstName} ${selected!.lastName}\n",
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
