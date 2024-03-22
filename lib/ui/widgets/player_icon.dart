import 'package:fantabasket_app_flutter/bloc/cubit/credits_cubit/credits_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/select_player_bloc/select_player_bloc.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/players_list.dart';
import 'package:fantabasket_app_flutter/ui/widgets/player_bar.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerIcon extends StatefulWidget {
  final List<Player> players;

  final BuildContext mContext;

  const PlayerIcon({
    required this.players,
    required this.mContext,
    super.key,
  });

  @override
  State<PlayerIcon> createState() => _PlayerIconState();
}

class _PlayerIconState extends State<PlayerIcon> {
  Player? selected;

  @override
  void initState() {
    super.initState();
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
            var checkedPlayers =
                widget.mContext.read<SelectPlayerBloc>().getCheckedPlayers();
            print("Checked players: $checkedPlayers");
            final List<Player> list = List.from(
                Set.from(widget.players).difference(Set.from(checkedPlayers)));
            return Container(
              padding: const EdgeInsets.all(8.0),
              height: height,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...list.map(
                        (player) => GestureDetector(
                          onTap: () {
                            int total =
                                widget.mContext.read<CreditsCubit>().getTotal();
                            int value = player.value;
                            List<Player> checkedPlayers = widget.mContext
                                .read<SelectPlayerBloc>()
                                .checkedPlayers;
                            if (checkedPlayers.length < 5 &&
                                total + value <= 65) {
                              widget.mContext.read<CreditsCubit>().decrement(
                                  selected == null ? 0 : selected!.value);
                              widget.mContext
                                  .read<CreditsCubit>()
                                  .increment(value);
                              if (selected != null) {
                                widget.mContext
                                    .read<SelectPlayerBloc>()
                                    .removePlayer(selected!);
                              }
                              widget.mContext
                                  .read<SelectPlayerBloc>()
                                  .addPlayer(player);
                              Navigator.of(context).pop(player);
                            } else {
                              Navigator.of(context).pop(null);
                            }
                          },
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
        if (selectedPlayer != null && selectedPlayer != selected) {
          setState(() => selected = selectedPlayer);
        }
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
