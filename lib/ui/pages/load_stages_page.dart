import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/add_team_bloc/add_team_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/create_team_bloc/create_team_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/select_team_bloc/select_team_bloc.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/ui/widgets/load_stage_card.dart';
import 'package:fantabasket_app_flutter/ui/widgets/sponsors_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadStagesPage extends StatefulWidget with AutoRouteWrapper {
  const LoadStagesPage({super.key});

  @override
  State<LoadStagesPage> createState() => _LoadStagesPageState();

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
}

class _LoadStagesPageState extends State<LoadStagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 14, 13, 13),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 14, 13, 13),
        title: const Text(
          'Scegli la tappa',
          style: TextStyle(fontSize: 18),
        ),
        automaticallyImplyLeading: true,
      ),
      body: BlocConsumer<CreateTeamBloc, CreateTeamState>(
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
                children: [
                  const SponsorsBanner(),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            switch (state) {
                              TryGetStagesState() => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ResultGetStagesState(stagesList: var stages) =>
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: stages.count,
                                  itemBuilder: (context, index) =>
                                      LoadStageCard(
                                          stage: stages.stages![index]),
                                ),
                              _ => ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 4,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return const LoadStageCard(
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
    );
  }
}
