import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/ui/widgets/players_list_card.dart';
import 'package:fantabasket_app_flutter/ui/widgets/rank_card.dart';
import 'package:fantabasket_app_flutter/ui/widgets/sponsors_banner.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/create_team_bloc/create_team_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PlayersPage extends StatelessWidget with AutoRouteWrapper {
  const PlayersPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<CreateTeamBloc>(
            create: ((context) =>
                CreateTeamBloc(stagesRepository: context.read())..getStages()),
          )
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 14, 13, 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SponsorsBanner(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Text(
              "Giocatori",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
                fontSize: 25,
              ),
            ),
          ),
          const SizedBox(height: 10),
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
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: 'Inserisci nome...',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 173, 173, 173),
                ),
              ),
              style: const TextStyle(color: Colors.white),
              textAlignVertical: TextAlignVertical.center,
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: BlocConsumer<CreateTeamBloc, CreateTeamState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is ErrorGetStagesState) {
                  return const Center(
                    child: Text("Errore nel caricamento delle tappe"),
                  );
                } else if (state is EmptyGetStagesState) {
                  return const Column(
                    children: [
                      SponsorsBanner(),
                      Center(
                        child: Text("Nessuna tappa presente"),
                      ),
                    ],
                  );
                } else {
                  return Skeletonizer(
                    enabled: state is TryGetStagesState,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  switch (state) {
                                    TryGetStagesState() => const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ResultGetStagesState(
                                      stagesList: var stages
                                    ) =>
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: stages.count,
                                        itemBuilder: (context, index) =>
                                            PlayersListCard(
                                                stage: stages.stages![index]),
                                      ),
                                    _ => ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: 4,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return const PlayersListCard(
                                            stage: Stage(id: 0),
                                          );
                                        },
                                      ),
                                  }
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
