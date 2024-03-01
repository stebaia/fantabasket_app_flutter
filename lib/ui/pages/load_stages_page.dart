import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/create_team_bloc/create_team_bloc.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.router
                  .popUntil((route) => route.settings.name == CoreRoute.name);
            },
            icon: const Icon(Icons.close),
          ),
        ],
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
                    flex: 9,
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            if (state is ResultGetStagesState)
                              ...(context.read<CreateTeamBloc>().state
                                      as ResultGetStagesState)
                                  .stagesList
                                  .stages!
                                  .map((stage) => LoadStageCard(stage: stage))
                            else
                              ...(List.filled(
                                  6, LoadStageCard(stage: Stage(id: 0))))
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
