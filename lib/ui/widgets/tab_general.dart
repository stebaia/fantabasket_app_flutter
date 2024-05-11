import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/players_list.dart';
import 'package:fantabasket_app_flutter/ui/widgets/best_players_card.dart';
import 'package:flutter/material.dart';

class TabGeneral extends StatefulWidget {
  final DarkThemeProvider darkMode;
  final PlayersList list;

  const TabGeneral({
    required this.darkMode,
    required this.list,
    super.key,
  });

  @override
  State<TabGeneral> createState() => _TabGeneralState();
}

class _TabGeneralState extends State<TabGeneral> {
  late List<Player> _list;
  late TextEditingController _controller;

  _updateList() {
    _list = widget.list.players!
        .where((player) =>
            "${player.lastName} ${player.firstName}"
                .toLowerCase()
                .contains(_controller.text.toLowerCase()) ||
            player.team.toLowerCase().contains(_controller.text.toLowerCase()))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _list = widget.list.players!;
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 2.0,
          ),
          child: TextField(
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
              color: widget.darkMode.darkTheme ? Colors.white : Colors.black,
            ),
            textAlignVertical: TextAlignVertical.center,
            onChanged: (value) => setState(() => _updateList()),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _list.length,
                    itemBuilder: (context, index) =>
                        BestPlayersCard(player: _list[index]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
