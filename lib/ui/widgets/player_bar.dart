import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:flutter/material.dart';

class PlayerBar extends StatelessWidget {
  final Player? player;

  const PlayerBar({
    this.player,
    super.key,
  });

  Color _getColor() {
    int value = player!.value!;
    if (value == 0) {
      return Colors.white;
    } else if (value <= 5) {
      return const Color.fromARGB(255, 205, 127, 50);
    } else if (value > 5 && value <= 15) {
      return const Color.fromARGB(255, 192, 192, 192);
    } else {
      return const Color.fromARGB(255, 229, 184, 11);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Card(
        color: _getColor(),
        elevation: 2,
        child: Row(
          children: [
            Expanded(
              flex: 2,
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
            Expanded(
              flex: 5,
              child: Text(
                "${player?.lastName} ${player?.firstName}",
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                "${player?.team}",
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "${player?.value}",
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
