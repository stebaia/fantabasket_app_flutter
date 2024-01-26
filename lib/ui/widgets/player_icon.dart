import 'package:flutter/material.dart';

class PlayerIcon extends StatelessWidget {
  const PlayerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.symmetric(
                horizontal:
                    BorderSide(color: Color.fromARGB(255, 201, 195, 195)),
                vertical: BorderSide(color: Color.fromARGB(255, 201, 195, 195)),
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.17,
            height: MediaQuery.of(context).size.width * 0.17,
            child: Icon(
              Icons.person,
              size: MediaQuery.of(context).size.width * 0.13,
              color: const Color.fromARGB(255, 201, 195, 195),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Seleziona giocatore\n",
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
