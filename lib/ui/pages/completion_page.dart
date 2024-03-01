import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/captain_cubit.dart/captain_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/sixth_man_cubit/sixth_man_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/select_player_bloc/select_player_bloc.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/ui/widgets/completion_button.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompletionPage extends StatelessWidget with AutoRouteWrapper {
  final List<Player> team;
  final List<Player> side;

  const CompletionPage({
    super.key,
    required this.team,
    required this.side,
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
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();
    print("SIde prima: $side");
    side.removeWhere(
        (player) => player.category == "A" || player.category == "B");
    print("SIde dopo: $side");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close),
          )
        ],
        automaticallyImplyLeading: true,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(flex: 1, child: SizedBox()),
            const Expanded(
              flex: 1,
              child: Text(
                "Nome squadra",
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 4,
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  hintText: 'Inserisci nome...',
                ),
                textAlignVertical: TextAlignVertical.center,
                controller: _controller,
              ),
            ),
            const Expanded(flex: 2, child: SizedBox()),
            const Expanded(
                flex: 1,
                child: Text(
                  "Seleziona capitano",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                )),
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 9,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...team.map(
                      (player) => BlocBuilder<CaptainCubit, CaptainState>(
                        builder: (BuildContext context, CaptainState state) {
                          var captain =
                              context.read<CaptainCubit>().getCaptain();
                          return GestureDetector(
                            onTap: () => context
                                .read<CaptainCubit>()
                                .selectCaptain(player),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: (captain == null ||
                                            player.id != captain.id)
                                        ? Colors.white
                                        : const Color.fromARGB(
                                            255, 225, 135, 57),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                elevation: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: const Icon(
                                          Icons.sports_basketball,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                    const Divider(height: 0),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        decoration: BoxDecoration(
                                          color: Constants
                                              .categoryColors[player.category],
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ),
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(8.0),
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
            const Expanded(flex: 2, child: SizedBox()),
            const Expanded(
              flex: 1,
              child: Text(
                "Seleziona sesto uomo",
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 9,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...side.map(
                      (player) => BlocBuilder<SixthManCubit, SixthManState>(
                        builder: (context, state) {
                          var sixth =
                              context.read<SixthManCubit>().getSixthMan();
                          return GestureDetector(
                            onTap: () => context
                                .read<SixthManCubit>()
                                .selectSixthMan(player),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color:
                                        (sixth == null || player.id != sixth.id)
                                            ? Colors.white
                                            : const Color.fromARGB(
                                                255, 225, 135, 57),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                elevation: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: const Icon(
                                          Icons.sports_basketball,
                                          size: 40,
                                        ),
                                      ),
                                    ),
                                    const Divider(height: 0),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        decoration: BoxDecoration(
                                          color: Constants
                                              .categoryColors[player.category],
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ),
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(8.0),
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
            const Expanded(flex: 2, child: SizedBox()),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CompletionButton(controller: _controller)],
              ),
            ),
            const Expanded(flex: 1, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
