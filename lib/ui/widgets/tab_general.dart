import 'package:fantabasket_app_flutter/bloc/all_players_bloc/all_players_bloc.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/ui/widgets/best_players_card.dart';
import 'package:fantabasket_app_flutter/ui/widgets/double_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabGeneral extends StatelessWidget {
  final DarkThemeProvider darkMode;

  const TabGeneral({
    required this.darkMode,
    super.key,
  });

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
              color: darkMode.darkTheme ? Colors.white : Colors.black,
            ),
            textAlignVertical: TextAlignVertical.center,
            onChanged: (value) {},
          ),
        ),
        Expanded(
          child: BlocBuilder<AllPlayersBloc, AllPlayersState>(
              builder: (context, state) {
            return Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    switch (state) {
                      TryAllPlayersState() => const Center(
                          child: DoubleSpinner(),
                        ),
                      ResultAllPlayersState(playersList: var players) =>
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: players.count,
                          itemBuilder: (context, index) =>
                              BestPlayersCard(player: players.players![index]),
                        ),
                      _ => ListView.builder(
                          shrinkWrap: true,
                          itemCount: 4,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return const BestPlayersCard(
                              player: Player(
                                id: 0,
                                category: "",
                                email: "",
                                firstName: "",
                                lastName: "",
                                phone: "",
                                photo: "",
                                team: "",
                                value: 0,
                              ),
                            );
                          },
                        ),
                    }
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
