import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/create_team_bloc/create_team_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.close))],
        automaticallyImplyLeading: true,
      ),
      body: BlocConsumer<CreateTeamBloc, CreateTeamState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TryGetStagesState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorGetStagesState) {
            return const Center(
              child: Text("Errore nel caricamento delle tappe"),
            );
          } else {
            return SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...(context.read<CreateTeamBloc>().state
                            as ResultGetStagesState)
                        .stagesList
                        .stages!
                        .map((stage) => SizedBox(
                              width: width * 0.9,
                              child: Card(
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${stage.city}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ))
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
