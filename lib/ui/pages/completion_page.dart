import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/add_team_bloc/add_team_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/captain_cubit.dart/captain_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/sixth_man_cubit/sixth_man_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/select_player_bloc/select_player_bloc.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/team.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:fantabasket_app_flutter/ui/widgets/captain_selection.dart';
import 'package:fantabasket_app_flutter/ui/widgets/completion_button.dart';
import 'package:fantabasket_app_flutter/ui/widgets/player_bar.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CompletionPage extends StatelessWidget with AutoRouteWrapper {
  final List<Player> players;
  final List<Player> side;
  final int stageId;
  final Team? team;

  const CompletionPage({
    super.key,
    required this.players,
    required this.side,
    required this.stageId,
    required this.team,
  });

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<SelectPlayerBloc>(
            create: ((context) => SelectPlayerBloc()),
          ),
          BlocProvider<CaptainCubit>(
            create: ((context) => CaptainCubit(context: context)),
          ),
          BlocProvider<SixthManCubit>(
            create: ((context) => SixthManCubit(context: context)),
          ),
          BlocProvider<AddTeamBloc>(
            create: ((context) => AddTeamBloc(teamRepository: context.read())),
          ),
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);

    final controller = TextEditingController();
    side.removeWhere((player) =>
        player.category == "A1" ||
        player.category == "A2" ||
        player.category == "B" ||
        player.category == "C1");
    side.sort((b, a) => Constants.categoryValues[a.category]!
        .compareTo(Constants.categoryValues[b.category]!));
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {},
            child: CompletionButton(
              controller: controller,
              players: players,
              stageId: stageId,
              team: team,
            ),
          )
        ],
        foregroundColor: darkMode.darkTheme ? Colors.white : Colors.black,
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: true,
      ),
      body: BlocListener<AddTeamBloc, AddTeamState>(
        listener: (buildContext, state) {
          if (state is ResultCreateState) {
            context.router
                .popUntil((route) => route.settings.name == CoreRoute.name);
          } else if (state is ErrorCreateState) {
            print(state.errorString);
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      content: Text(state.errorString),
                      actions: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.background,
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Ok"))
                      ],
                    ));
          }
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Nome squadra",
                  style: TextStyle(
                    color: darkMode.darkTheme ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
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
                  controller: controller,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Seleziona capitano",
                  style: TextStyle(
                    color: darkMode.darkTheme ? Colors.white : Colors.black,
                  ),
                ),
                SelectCaptain(team: players),
                const SizedBox(height: 20),
                Text(
                  "Seleziona sesto uomo",
                  style: TextStyle(
                    color: darkMode.darkTheme ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                BlocBuilder<SixthManCubit, SixthManState>(
                    builder: (context, state) {
                  var sixthMan = context.read<SixthManCubit>().getSixthMan();
                  return ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: side.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => context
                          .read<SixthManCubit>()
                          .selectSixthMan(side[index]),
                      child: PlayerBar(
                        player: side[index],
                        enabled: true,
                        sixth: sixthMan != null && sixthMan.id == side[index].id
                            ? sixthMan
                            : null,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
