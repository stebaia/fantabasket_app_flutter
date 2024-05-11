import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
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
  late PlayersList list;

  @override
  void initState() {
    super.initState();
    list = widget.list;
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
            onChanged: (value) {},
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.list.count,
                    itemBuilder: (context, index) =>
                        BestPlayersCard(player: widget.list.players![index]),
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
