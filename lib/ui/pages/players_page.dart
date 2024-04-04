import 'package:fantabasket_app_flutter/ui/widgets/rank_card.dart';
import 'package:fantabasket_app_flutter/ui/widgets/sponsors_banner.dart';
import 'package:flutter/material.dart';

class PlayersPage extends StatelessWidget {
  const PlayersPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final mockList = {
      "Bologna": 1,
      "Forli": 5,
      "Cesena": 2,
      "Rimini": 4,
      "Padova": 3,
      "Reggio Emilia": 8,
      "Firenze": 1,
      "Novara": 2,
      "Torino": 7,
      "Brescia": 5,
    };
    return Container(
      color: Color.fromARGB(255, 14, 13, 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SponsorsBanner(),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Text(
              "Giocatori",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 225, 135, 57),
                fontSize: 25,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 2.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                focusColor: Colors.orange,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                hintText: 'Inserisci nome...',
                hintStyle: TextStyle(color: Color.fromARGB(255, 173, 173, 173)),
              ),
              style: TextStyle(color: Colors.white),
              textAlignVertical: TextAlignVertical.center,
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...mockList.entries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      child: RankingCard(entry: entry),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
