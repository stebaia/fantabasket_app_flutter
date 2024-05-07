import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/add_team_bloc/add_team_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/create_team_bloc/create_team_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/captain_cubit.dart/captain_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/sixth_man_cubit/sixth_man_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/select_player_bloc/select_player_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/credits_cubit/credits_cubit.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:fantabasket_app_flutter/ui/widgets/completion_button.dart';
import 'package:fantabasket_app_flutter/ui/widgets/player_bar.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CompletionPage extends StatelessWidget with AutoRouteWrapper {
  final List<Player> team;
  final List<Player> side;
  final int stageId;

  const CompletionPage({
    super.key,
    required this.team,
    required this.side,
    required this.stageId,
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
    side.removeWhere(
        (player) => player.category == "A" || player.category == "B");
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {},
            child: CompletionButton(
              controller: controller,
              team: team,
              stageId: stageId,
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                SizedBox(
                  height: 170,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...team.map(
                          (player) => BlocBuilder<CaptainCubit, CaptainState>(
                            builder:
                                (BuildContext context, CaptainState state) {
                              var captain =
                                  context.read<CaptainCubit>().getCaptain();
                              return GestureDetector(
                                onTap: () => context
                                    .read<CaptainCubit>()
                                    .selectCaptain(player),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: (captain == null ||
                                                player.id != captain.id)
                                            ? Colors.white
                                            : Theme.of(context)
                                                .colorScheme
                                                .background,
                                        width: 4,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    elevation: 4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            width: 140,
                                            height: 130,
                                            child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(20),
                                                        topRight:
                                                            Radius.circular(
                                                                20)),
                                                child: player.photo != ''
                                                    ? Image.network(
                                                        player.photo,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Image.network(
                                                        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/LeBron_James_%2851959977144%29_%28cropped2%29.jpg/640px-LeBron_James_%2851959977144%29_%28cropped2%29.jpg',
                                                        fit: BoxFit.cover))),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            decoration: BoxDecoration(
                                              color: Constants.categoryColors[
                                                  player.category],
                                              borderRadius:
                                                  const BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                            ),
                                            width: double.infinity,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Text(
                                              "${player.lastName} ${player.firstName}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
