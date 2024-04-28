import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/create_team_bloc/create_team_bloc.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/ui/widgets/double_spinner.dart';
import 'package:fantabasket_app_flutter/ui/widgets/rank_card.dart';
import 'package:fantabasket_app_flutter/ui/widgets/sponsors_banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RankPage extends StatefulWidget with AutoRouteWrapper {
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

  static const Map<String, int> mockList = {
    "Bologna": 1,
    "Forli": 5,
    "Cesena": 2,
    "Rimini": 4,
    "Padova": 3,
    "Reggio Emilia": 8,
    "Firenze": 1,
    "Novara": 2,
    "Torino": 7,
    "Brescia": 5,
  };
  const RankPage({super.key});

  @override
  State<RankPage> createState() => _RankPageState();
}

class _RankPageState extends State<RankPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);

    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SponsorsBanner(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Text(
              "Classifiche",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: darkMode.darkTheme ? Colors.white : Colors.black,
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
                  color: darkMode.darkTheme ? Colors.white : Colors.black),
              textAlignVertical: TextAlignVertical.center,
              onChanged: (value) {},
            ),
          ),
          Expanded(
            child: BlocBuilder<CreateTeamBloc, CreateTeamState>(
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
                                        child: DoubleSpinner(),
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
                                            RankingCard(
                                                stage: stages.stages![index]),
                                      ),
                                    _ => ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: 4,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return const RankingCard(
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
