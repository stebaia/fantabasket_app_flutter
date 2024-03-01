import 'package:fantabasket_app_flutter/bloc/cubit/captain_cubit.dart/captain_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/sixth_man_cubit/sixth_man_cubit.dart';
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
  bool hasCaptain = false;
  bool hasSixthMan = false;

  @override
  Widget build(BuildContext context) {
    widget.controller.addListener(
        () => setState(() => hasName = widget.controller.text != ""));

    var enabled = hasName && hasCaptain && hasSixthMan;

    return BlocListener<SixthManCubit, SixthManState>(
      listener: (BuildContext context, state) {
        setState(
            () => hasSixthMan = context.read<SixthManCubit>().sixthMan != null);
      },
      child: BlocListener<CaptainCubit, CaptainState>(
        listener: (BuildContext context, state) {
          setState(
              () => hasCaptain = context.read<CaptainCubit>().captain != null);
        },
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: enabled
                  ? const Color.fromARGB(255, 225, 135, 57)
                  : const Color.fromARGB(255, 208, 201, 195)),
          onPressed: widget.controller.text != "" ? () {} : null,
          child: Text(
            "Conferma squadra",
            style: TextStyle(
              color: enabled ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
