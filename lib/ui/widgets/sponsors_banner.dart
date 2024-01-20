import 'package:flutter/material.dart';

class SponsorsBanner extends StatelessWidget {
  const SponsorsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: MediaQuery.of(context).size.height * 0.09,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: const Text(
        "Sponsors",
        style: TextStyle(fontSize: 22),
      ),
    );
  }
}
