import 'package:fantabasket_app_flutter/bloc/add_team_bloc/add_team_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/create_team_bloc/create_team_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/captain_cubit.dart/captain_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/sixth_man_cubit/sixth_man_cubit.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompletionButton extends StatefulWidget {
  final TextEditingController controller;
  final List<Player> team;
  final Stage stage;

  const CompletionButton({
    super.key,
    required this.controller,
    required this.team,
    required this.stage,
  });

  @override
  State<CompletionButton> createState() => _CompletionButtonState();
}

class _CompletionButtonState extends State<CompletionButton> {
  bool hasName = false;

  @override
  Widget build(BuildContext context) {
    widget.controller.addListener(
        () => setState(() => hasName = widget.controller.text != ""));

    var captain = context.watch<CaptainCubit>();
    var sixth = context.watch<SixthManCubit>();

    var enabled = hasName && captain.captain != null && sixth.sixthMan != null;

    return BlocBuilder<AddTeamBloc, AddTeamState>(
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: enabled
                ? const Color.fromARGB(255, 225, 135, 57)
                : const Color.fromARGB(255, 208, 201, 195),
            minimumSize: const Size.fromWidth(150),
          ),
          onPressed: enabled
              ? () {
                  var players = widget.team
                      .map((player) => player.id)
                      .toList(growable: true);
                  var sm = sixth.sixthMan!.id;
                  players.add(sm);
                  var cpt = captain.captain!.id;
                  var name = widget.controller.text;
                  context.read<AddTeamBloc>().addNewTeam(
                        name: name,
                        player: players,
                        cpt: cpt,
                        stage: widget.stage.id,
                      );
                }
              : null,
          child: state is TryCreateState
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  "Conferma squadra",
                  style: TextStyle(
                    color: enabled ? Colors.white : Colors.grey,
                  ),
                ),
        );
      },
    );
  }
}
