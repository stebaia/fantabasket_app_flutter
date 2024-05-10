import 'package:fantabasket_app_flutter/bloc/cubit/credits_cubit/credits_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/remove_filters_cubit/remove_filters_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/select_player_bloc/select_player_bloc.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/ui/widgets/category_button.dart';
import 'package:fantabasket_app_flutter/ui/widgets/player_bar.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    _selectedCategories = [];
  }

  _updateList() {
    _players = _selectedCategories.isEmpty
        ? widget.players
        : widget.players
            .where((player) => _selectedCategories.contains(player.category))
            .toList();
    _players = _players
        .where((player) =>
            "${player.lastName} ${player.firstName}"
                .toLowerCase()
                .contains(_controller.text.toLowerCase()) ||
            player.team.toLowerCase().contains(_controller.text.toLowerCase()))
        .toList();
  }

  onCategorySelected(String category) {
    setState(() {
      _selectedCategories.contains(category)
          ? _selectedCategories.remove(category)
          : _selectedCategories.add(category);
      _updateList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);
    var height = MediaQuery.of(context).size.height * 0.75;
    var checkedPlayers =
        widget.mContext.read<SelectPlayerBloc>().getCheckedPlayers();
    int total = widget.mContext.read<CreditsCubit>().getTotal();
    int currentValue = widget.selected == null
        ? 0
        : Constants.categoryValues[widget.selected!.category]!;
    final List<Player> list =
        List.from(Set.from(_players).difference(Set.from(checkedPlayers)));
    list.sort((b, a) => Constants.categoryValues[a.category]!
        .compareTo(Constants.categoryValues[b.category]!));
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Seleziona giocatore',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: darkMode.darkTheme ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              focusColor: Theme.of(context).colorScheme.background,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.background,
                  width: 2.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              hintText: 'Inserisci nome...',
              hintStyle: const TextStyle(
                color: Color.fromARGB(255, 173, 173, 173),
              ),
            ),
            cursorColor: const Color.fromARGB(255, 173, 173, 173),
            style: TextStyle(
              color: darkMode.darkTheme ? Colors.white : Colors.black,
            ),
            textAlignVertical: TextAlignVertical.center,
            onChanged: (value) => setState(() => _updateList()),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryButton(onClick: onCategorySelected, category: "A1"),
                CategoryButton(onClick: onCategorySelected, category: "A2"),
                CategoryButton(onClick: onCategorySelected, category: "B"),
                CategoryButton(onClick: onCategorySelected, category: "C1"),
                CategoryButton(onClick: onCategorySelected, category: "C2"),
                CategoryButton(onClick: onCategorySelected, category: "D"),
                CategoryButton(onClick: onCategorySelected, category: "PROMO"),
                CategoryButton(
                    onClick: onCategorySelected, category: "AMATORE"),
                CategoryButton(
                    onClick: onCategorySelected, category: "GIOVANE"),
                CategoryButton(
                    onClick: onCategorySelected, category: "RITIRATO"),
              ],
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
              onTap: () {
                setState(() {
                  _players = widget.players;
                  _controller.clear();
                  _selectedCategories = [];
                  context.read<RemoveFiltersCubit>().reset();
                });
              },
              child: const Row(
                children: [
                  Icon(Icons.delete_outline),
                  Text("Rimuovi tutti i filtri"),
                ],
              )),
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
                      var enabled = total -
                              currentValue +
                              Constants.categoryValues[player.category]! <=
                          65;
                      return GestureDetector(
                        onTap: enabled
                            ? () {
                                int value =
                                    Constants.categoryValues[player.category]!;
                                List<Player> checkedPlayers = widget.mContext
                                    .read<SelectPlayerBloc>()
                                    .checkedPlayers;
                                if (checkedPlayers.length <= 5 &&
                                    total - currentValue + value <= 65) {
                                  widget.mContext
                                      .read<CreditsCubit>()
                                      .decrement(widget.selected == null
                                          ? 0
                                          : Constants.categoryValues[
                                              widget.selected!.category]!);
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
