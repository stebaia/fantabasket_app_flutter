import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:flutter/material.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';

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
      height: MediaQuery.of(context).size.height * 0.1,
      child: Card(
        color: enabled ? _getColor() : const Color.fromARGB(255, 212, 207, 207),
        elevation: 2,
        child: Row(
          children: [
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 4,
              child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child:
                      Container() /*éClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.network(
                    player!.image!,
                    fit: BoxFit.fill,
                  ),
                ),*/
                  ),
            ),
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 14,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "${player.lastName} ${player.firstName}",
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 12,
              child: Text(
                player.team,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 5,
              child: Text(
                "${player.value}",
                textAlign: TextAlign.center,
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
