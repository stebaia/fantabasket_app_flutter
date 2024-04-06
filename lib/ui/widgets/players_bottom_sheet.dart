import 'package:fantabasket_app_flutter/bloc/cubit/credits_cubit/credits_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/select_player_bloc/select_player_bloc.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/ui/widgets/player_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayersBottomSheet extends StatelessWidget {
  final BuildContext mContext;
  final List<Player> players;
  final Player? selected;

  const PlayersBottomSheet({
    required this.mContext,
    required this.players,
    required this.selected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.7;
    var checkedPlayers = mContext.read<SelectPlayerBloc>().getCheckedPlayers();
    int total = mContext.read<CreditsCubit>().getTotal();
    int currentValue = selected == null ? 0 : selected!.value;
    final List<Player> list =
        List.from(Set.from(players).difference(Set.from(checkedPlayers)));
    return Container(
      color: Color.fromARGB(255, 14, 13, 13),
      padding: const EdgeInsets.all(8.0),
      height: height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Seleziona giocatore',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            ...list.map(
              (player) {
                var enabled = total - currentValue + player.value <= 65;
                return GestureDetector(
                  onTap: enabled
                      ? () {
                          int value = player.value;
                          List<Player> checkedPlayers =
                              mContext.read<SelectPlayerBloc>().checkedPlayers;
                          if (checkedPlayers.length <= 5 &&
                              total - currentValue + value <= 65) {
                            mContext.read<CreditsCubit>().decrement(
                                selected == null ? 0 : selected!.value);
                            mContext.read<CreditsCubit>().increment(value);
                            if (selected != null) {
                              mContext
                                  .read<SelectPlayerBloc>()
                                  .removePlayer(selected!);
                            }
                            mContext.read<SelectPlayerBloc>().addPlayer(player);
                            Navigator.of(context).pop(player);
                          } else {
                            Navigator.of(context).pop(null);
                          }
                        }
                      : null,
                  child: PlayerBar(
                    player: player,
                    enabled: enabled,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
