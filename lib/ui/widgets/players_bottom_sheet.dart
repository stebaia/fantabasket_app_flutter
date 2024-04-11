import 'package:fantabasket_app_flutter/bloc/cubit/credits_cubit/credits_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/select_player_bloc/select_player_bloc.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/ui/widgets/category_button.dart';
import 'package:fantabasket_app_flutter/ui/widgets/player_bar.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  late List<Player> _players;
  late List<String> _selectedCategories;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _players = widget.players;
    _controller = TextEditingController();
    _selectedCategories = Constants.categoryValues.keys.toList();
  }

  onCategorySelected(String category) {
    setState(() {
      _selectedCategories.contains(category)
          ? _selectedCategories.remove(category)
          : _selectedCategories.add(category);
      _players = widget.players
          .where((player) =>
              "${player.lastName} ${player.firstName}"
                  .toLowerCase()
                  .contains(_controller.text.toLowerCase()) ||
              player.team
                  .toLowerCase()
                  .contains(_controller.text.toLowerCase()))
          .where((player) => _selectedCategories.contains(player.category))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.75;
    var checkedPlayers =
        widget.mContext.read<SelectPlayerBloc>().getCheckedPlayers();
    int total = widget.mContext.read<CreditsCubit>().getTotal();
    int currentValue = widget.selected == null ? 0 : widget.selected!.value;
    final List<Player> list =
        List.from(Set.from(_players).difference(Set.from(checkedPlayers)));
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 41, 40, 40),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Seleziona giocatore',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 20),
          SearchBar(
            controller: _controller,
            shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)))),
            backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(32, 181, 181, 181),
            ),
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                color: Colors.white,
              ),
            ),
            hintText: "Inserisci giocatore o squadra...",
            hintStyle: MaterialStateProperty.all(
              const TextStyle(
                color: Color.fromARGB(255, 219, 217, 217),
              ),
            ),
            onChanged: (value) => setState(() {
              _players = widget.players
                  .where((player) =>
                      "${player.lastName} ${player.firstName}"
                          .toLowerCase()
                          .contains(value.toLowerCase()) ||
                      player.team.toLowerCase().contains(value.toLowerCase()))
                  .where(
                      (player) => _selectedCategories.contains(player.category))
                  .toList();
            }),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryButton(onClick: onCategorySelected, category: "A"),
                CategoryButton(onClick: onCategorySelected, category: "B"),
                CategoryButton(onClick: onCategorySelected, category: "C1"),
                CategoryButton(onClick: onCategorySelected, category: "C2"),
                CategoryButton(onClick: onCategorySelected, category: "D"),
                CategoryButton(onClick: onCategorySelected, category: "P"),
                CategoryButton(onClick: onCategorySelected, category: "F"),
              ],
            ),
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
