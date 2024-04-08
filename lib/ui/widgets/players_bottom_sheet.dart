import 'package:fantabasket_app_flutter/bloc/cubit/credits_cubit/credits_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/select_player_bloc/select_player_bloc.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/ui/widgets/player_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayersBottomSheet extends StatefulWidget {
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
  State<PlayersBottomSheet> createState() => _PlayersBottomSheetState();
}

class _PlayersBottomSheetState extends State<PlayersBottomSheet> {
  late List<Player> players;

  @override
  void initState() {
    super.initState();
    players = widget.players;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.7;
    var checkedPlayers =
        widget.mContext.read<SelectPlayerBloc>().getCheckedPlayers();
    int total = widget.mContext.read<CreditsCubit>().getTotal();
    int currentValue = widget.selected == null ? 0 : widget.selected!.value;
    final List<Player> list =
        List.from(Set.from(players).difference(Set.from(checkedPlayers)));
    return Container(
      color: Color.fromARGB(255, 14, 13, 13),
      padding: const EdgeInsets.all(8.0),
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Seleziona giocatore',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 20,
                child: SearchBar(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(32, 181, 181, 181),
                  ),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  hintText: "Digita il nome del giocatore...",
                  hintStyle: MaterialStateProperty.all(
                    const TextStyle(
                      color: Color.fromARGB(255, 219, 217, 217),
                    ),
                  ),
                  onChanged: (value) => setState(() {
                    players = widget.players
                        .where((player) =>
                            "${player.lastName} ${player.firstName}"
                                .toLowerCase()
                                .contains(value))
                        .toList();
                  }),
                ),
              ),
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.filter_list,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
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
                                List<Player> checkedPlayers = widget.mContext
                                    .read<SelectPlayerBloc>()
                                    .checkedPlayers;
                                if (checkedPlayers.length <= 5 &&
                                    total - currentValue + value <= 65) {
                                  widget.mContext
                                      .read<CreditsCubit>()
                                      .decrement(widget.selected == null
                                          ? 0
                                          : widget.selected!.value);
                                  widget.mContext
                                      .read<CreditsCubit>()
                                      .increment(value);
                                  if (widget.selected != null) {
                                    widget.mContext
                                        .read<SelectPlayerBloc>()
                                        .removePlayer(widget.selected!);
                                  }
                                  widget.mContext
                                      .read<SelectPlayerBloc>()
                                      .addPlayer(player);
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
          ),
        ],
      ),
    );
  }
}
