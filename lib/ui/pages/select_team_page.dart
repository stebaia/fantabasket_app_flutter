import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/select_team_bloc/select_team_bloc.dart';
import 'package:fantabasket_app_flutter/ui/widgets/player_bar.dart';
import 'package:fantabasket_app_flutter/ui/widgets/player_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectTeamPage extends StatelessWidget with AutoRouteWrapper {
  const SelectTeamPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<SelectTeamBloc>(
            create: ((context) =>
                SelectTeamBloc(stagesRepository: context.read())..getPlayers()),
          )
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close),
          )
        ],
        automaticallyImplyLeading: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: const Color.fromARGB(255, 225, 135, 57),
                child: const Text(
                  "0/65",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PlayerIcon(),
                          PlayerIcon(),
                          PlayerIcon(),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PlayerIcon(),
                            PlayerIcon(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: BlocConsumer<SelectTeamBloc, SelectTeamState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: const Color.fromARGB(255, 225, 135, 57),
                                child: const Row(
                                  children: [
                                    Expanded(
                                      flex: 8,
                                      child: Text(
                                        "Lista giocatori",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Icon(
                                        Icons.filter_list_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: state is ResultGetPlayersState
                                  ? ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          state.playersList.players!.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return PlayerBar(
                                          player:
                                              state.playersList.players![index],
                                        );
                                      },
                                    )
                                  : const Center(
                                      child: CircularProgressIndicator()),
                            ),
                          ],
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
