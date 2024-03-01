import 'package:fantabasket_app_flutter/bloc/cubit/captain_cubit.dart/captain_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/sixth_man_cubit/sixth_man_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/select_player_bloc/select_player_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompletionButton extends StatefulWidget {
  final TextEditingController controller;

  const CompletionButton({
    super.key,
    required this.controller,
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
              ? const Color.fromARGB(255, 225, 135, 57)
              : const Color.fromARGB(255, 208, 201, 195)),
      onPressed: enabled ? () async {} : null,
      child: Text(
        "Conferma squadra",
        style: TextStyle(
          color: enabled ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
