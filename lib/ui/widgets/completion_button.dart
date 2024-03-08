import 'package:fantabasket_app_flutter/bloc/add_team_bloc/add_team_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/captain_cubit.dart/captain_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/sixth_man_cubit/sixth_man_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/select_player_bloc/select_player_bloc.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/bloc/create_team_bloc/create_team_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompletionButton extends StatefulWidget {
  final TextEditingController controller;
  final List<Player> team;

  const CompletionButton({
    super.key,
    required this.controller,
    required this.team,
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

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: enabled
              ? const Color.fromARGB(255, 104, 79, 57)
              : const Color.fromARGB(255, 208, 201, 195)),
      onPressed: enabled
          ? () async {
              var players =
                  widget.team.map((player) => player.id).toList(growable: true);
              var sm = sixth.sixthMan!.id;
              players.add(sm);
              var cpt = captain.captain!.id;
              var name = widget.controller.text;
              print(
                "Players: $players, \ncpt: $cpt, \nname: $name, \nsixth: $sm",
              );
              context.read<AddTeamBloc>().addNewTeam(
                    name: name,
                    player: players,
                    cpt: cpt,
                  );
            }
          // AGGIUNGERE SQUADRA A STAGE
          : null,
      child: Text(
        "Conferma squadra",
        style: TextStyle(
          color: enabled ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
