import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    widget.controller.addListener(
      () => setState(() {}),
    );
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: widget.controller.text != ""
              ? const Color.fromARGB(255, 225, 135, 57)
              : const Color.fromARGB(255, 208, 201, 195)),
      onPressed: widget.controller.text != "" ? () {} : null,
      child: Text(
        "Conferma squadra",
        style: TextStyle(
          color: widget.controller.text != "" ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
