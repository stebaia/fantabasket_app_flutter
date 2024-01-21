import 'package:flutter/material.dart';

class TeamCard extends StatelessWidget {
  final int team;

  const TeamCard({
    required this.team,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 2,
        child: Text(
          'text $team',
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
