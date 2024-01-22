import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        surfaceTintColor: Colors.white,
        color: const Color.fromARGB(255, 246, 246, 238),
        elevation: 2,
        child: Column(
          children: [
            const Expanded(
                flex: 10,
                child: SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    child: FadeInImage(
                      image: NetworkImage(
                        "https://www.modenatoday.it/~media/horizontal-hi/15481104953775/castelnuovo-campo-da-basket-bryant-02-2.jpeg",
                      ),
                      placeholder: AssetImage("assets/images/campo.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                )),
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                child: Text(
                  'Torneo: torneo $team',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                child: const Text(
                  'Nome squadra: Fantateam',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                child: const Text(
                  'Fantapunti: 120',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                child: const Text(
                  'Posizione: 1°',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            const Expanded(flex: 1, child: SizedBox())
          ],
        ),
      ),
    );
  }
}
