import 'package:fantabasket_app_flutter/bloc/select_player_bloc/select_player_bloc.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerIcon extends StatelessWidget {
  final Player? player;

  const PlayerIcon({
    required this.player,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: player == null
          ? null
          : () => context.read<SelectPlayerBloc>().removePlayer(player!),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.symmetric(
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
                color: const Color.fromARGB(255, 201, 195, 195),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              player == null
                  ? "Seleziona giocatore\n"
                  : "${player!.firstName} ${player!.lastName}\n",
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
