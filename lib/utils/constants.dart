import 'package:fantabasket_app_flutter/model/malus.dart';
import 'package:fantabasket_app_flutter/model/match_day.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/player_detail.dart';
import 'package:fantabasket_app_flutter/model/player_in_rank.dart';
import 'package:fantabasket_app_flutter/model/player_match.dart';
import 'package:fantabasket_app_flutter/model/player_stage.dart';
import 'package:fantabasket_app_flutter/model/bonus.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/model/team_detail.dart';
import 'package:flutter/material.dart';
import 'package:pair/pair.dart';

class Constants {
  const Constants._();

  static const userKey = 'CURRENT_USER';
  static const regexEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static const baseUrl = "https://fantabasket.talkandprofit.net/";

  static const loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer et arcu lectus. Nam vestibulum massa sit amet tortor dignissim dignissim. Etiam blandit efficitur risus vel sollicitudin. Maecenas eu turpis ornare, dignissim mi pharetra, placerat lectus. Fusce eget lorem porttitor, vestibulum velit vitae, pretium nisl. Phasellus efficitur sed arcu et tincidunt. Pellentesque in ipsum eros. Sed interdum tristique sapien. Interdum et malesuada fames ac ante ipsum primis in faucibus. In hac habitasse platea dictumst.Phasellus quis placerat eros. Pellentesque ullamcorper pharetra fringilla. Aenean eget ligula ut enim laoreet tincidunt. Donec eu urna mi. Fusce ac mattis est. Morbi ac fermentum enim. Nunc tempor ultricies nunc. Maecenas iaculis pharetra rutrum. Sed feugiat fringilla ante at eleifend.Nulla tellus arcu, volutpat ac nulla at, blandit venenatis nunc. Praesent at tellus orci. Donec porttitor magna dolor, id consequat lectus ultricies ut. Phasellus a tellus faucibus est dictum blandit. Praesent consectetur malesuada bibendum. Donec ac elit in ipsum sollicitudin gravida eget non enim. Nulla facilisi. Etiam leo eros, consequat at porta non, luctus sit amet dolor. Pellentesque vestibulum vestibulum dolor, id rutrum nibh scelerisque elementum.Suspendisse potenti. Cras aliquam posuere purus ut mollis. Vivamus arcu elit, laoreet sed nisl nec, congue efficitur urna. Donec ac tempus nunc, sit amet aliquam ex. Donec ac mi sagittis, fringilla metus sed, luctus enim. Integer viverra tempor velit, eget tristique nunc efficitur in. Morbi dolor elit, condimentum sit amet justo vel, bibendum scelerisque mi. Integer interdum, ex et auctor volutpat, nisl nunc sollicitudin orci, et vehicula magna mi sed mauris. Ut dolor lacus, faucibus in dapibus ac, euismod sed velit. Mauris maximus convallis magna, non dictum magna pharetra quis. Aenean rhoncus scelerisque enim, ac tempus orci blandit ut.Quisque cursus dictum neque, sodales dignissim lorem viverra nec. Sed ornare ex eu dui blandit, vitae maximus eros tristique. Suspendisse rutrum nisl arcu, in feugiat nunc vehicula ac. Donec dapibus commodo vestibulum. Etiam vel mi at elit congue pulvinar. Cras dapibus lectus gravida tristique cursus. Donec id lorem pulvinar velit dapibus scelerisque.";

  static Map<String, Color> categoryColors = {
    'A': const Color.fromARGB(255, 182, 44, 35),
    'A1': const Color.fromARGB(255, 182, 44, 35),
    'A2': const Color.fromARGB(255, 233, 139, 15),
    'B': const Color.fromARGB(255, 106, 84, 13),
    'C1': const Color.fromARGB(255, 60, 92, 32),
    'C2': const Color.fromARGB(255, 66, 152, 69),
    'D': const Color.fromARGB(255, 57, 166, 193),
    'P': const Color.fromARGB(255, 38, 110, 169),
    'F': const Color.fromARGB(255, 145, 48, 183),
  };

  static Map<String, int> categoryValues = {
    'A': 25,
    'A1': 25,
    'A2': 25,
    'B': 20,
    'C1': 15,
    'C2': 10,
    'D': 10,
    'P': 5,
    'F': 0,
  };

  static Map<Player, int> mockPlayers = {
    const Player(
      id: 1,
      firstName: "Mario",
      lastName: "Rossi",
      value: 10,
      team: "",
      photo: "",
      phone: "",
      category: "A",
      email: "",
    ): 70,
    const Player(
      id: 2,
      firstName: "Luigi",
      lastName: "Bianchi",
      value: 10,
      team: "",
      photo: "",
      phone: "",
      category: "A",
      email: "",
    ): 60,
    const Player(
      id: 3,
      firstName: "Luca",
      lastName: "Verdi",
      value: 10,
      team: "",
      photo: "",
      phone: "",
      category: "A",
      email: "",
    ): 50,
    const Player(
      id: 4,
      firstName: "Alberto",
      lastName: "Angela",
      value: 10,
      team: "",
      photo: "",
      phone: "",
      category: "A",
      email: "",
    ): 80,
    const Player(
      id: 5,
      firstName: "Ciro",
      lastName: "Esposito",
      value: 10,
      team: "",
      photo: "",
      phone: "",
      category: "A",
      email: "",
    ): 79,
    const Player(
      id: 6,
      firstName: "Maurizio",
      lastName: "Costanzo",
      value: 5,
      team: "",
      photo: "",
      phone: "",
      category: "A",
      email: "",
    ): 70,
  };

  static PlayerDetail playerDetailMock = PlayerDetail(
    firstName: "Mario",
    lastName: "Rossi",
    team: "Bologna",
    stages: [
      PlayerStage(
        stage: const Stage(
          id: 2,
          fieldName: "Frampula Tournament 500",
          city: "Forlimpopoli",
          status: "Aperta",
          openingDate: "05/04/2024",
          closingDate: "07/04/2024",
          photo: "https://fantabasket.talkandprofit.net/images/noimage.jpg",
        ),
        matches: [
          ...List.generate(
              10,
              (index) => PlayerMatch(
                    dayNumber: index,
                    bonus: const Bonus(
                      pointMade: Pair("Punto realizzato", 2),
                      assist: Pair("Assist", 6),
                      block: Pair("Stoppata", 0),
                      bounce: Pair("Rimbalzo", 0),
                      buzzerBeater: Pair("Buzzer beater", 0),
                      dunk: Pair("Schiacciata", 20),
                      ankleBreaker: Pair("Ankle breaker", 0),
                      postAnd1Exultation: Pair("Esultanza post and 1", 0),
                      pregameRitual: Pair("Rituale pre partita", 0),
                      teamVictory: Pair("Vittoria squadra", 0),
                      ignorantClothing: Pair("Abbigliamento ignorante", 0),
                      speakerKiss: Pair("Bacio in bocca allo speaker", 0),
                      victory51: Pair("Vinta ai 51", 0),
                      mostLoved: Pair("Most loved", 0),
                      total: Pair("Totale", 34),
                    ),
                    malus: const Malus(
                      airball: Pair("Airball", 0),
                      fouls: Pair("Fallo", 2),
                      tacticalFouls: Pair("Fallo tattico", 0),
                      teamDefeat: Pair("Sconfitta squadra", 0),
                      reverseClothing: Pair("Abbigliamento al contrario", 0),
                      worstTeam: Pair("Squadra peggiore della giornata", 0),
                      concededDunk:
                          Pair("Schiacciata subita dalla squadra", 20),
                      lost51: Pair("Airball", 10),
                      basketConcededBuzzerBeater:
                          Pair("Canestro subito buzzer beater", 0),
                      shaqtinAFool: Pair("Shaqtin'a Fool", 0),
                      invisibleNumber: Pair("Numero giocatore non visibile", 0),
                      worstTeamName: Pair("Nome squadra più brutto", 0),
                      total: Pair("Totale", 32),
                    ),
                  )),
        ],
      ),
      PlayerStage(
        stage: const Stage(
          id: 3,
          fieldName: "Torneo Cesena",
          city: "Cesena",
          status: "Aperta",
          openingDate: "05/04/2024",
          closingDate: "07/04/2024",
          photo: "https://fantabasket.talkandprofit.net/images/noimage.jpg",
        ),
        matches: [
          ...List.generate(
              10,
              (index) => PlayerMatch(
                    dayNumber: index,
                    bonus: const Bonus(
                      pointMade: Pair("Punto realizzato", 2),
                      assist: Pair("Assist", 6),
                      block: Pair("Stoppata", 0),
                      bounce: Pair("Rimbalzo", 0),
                      buzzerBeater: Pair("Buzzer beater", 0),
                      dunk: Pair("Schiacciata", 20),
                      ankleBreaker: Pair("Ankle breaker", 0),
                      postAnd1Exultation: Pair("Esultanza post and 1", 0),
                      pregameRitual: Pair("Rituale pre partita", 0),
                      teamVictory: Pair("Vittoria squadra", 0),
                      ignorantClothing: Pair("Abbigliamento ignorante", 0),
                      speakerKiss: Pair("Bacio in bocca allo speaker", 0),
                      victory51: Pair("Vinta ai 51", 0),
                      mostLoved: Pair("Most loved", 0),
                      total: Pair("Totale", 34),
                    ),
                    malus: const Malus(
                      airball: Pair("Airball", 0),
                      fouls: Pair("Fallo", 2),
                      tacticalFouls: Pair("Fallo tattico", 0),
                      teamDefeat: Pair("Sconfitta squadra", 0),
                      reverseClothing: Pair("Abbigliamento al contrario", 0),
                      worstTeam: Pair("Squadra peggiore della giornata", 0),
                      concededDunk:
                          Pair("Schiacciata subita dalla squadra", 20),
                      lost51: Pair("Airball", 10),
                      basketConcededBuzzerBeater:
                          Pair("Canestro subito buzzer beater", 0),
                      shaqtinAFool: Pair("Shaqtin'a Fool", 0),
                      invisibleNumber: Pair("Numero giocatore non visibile", 0),
                      worstTeamName: Pair("Nome squadra più brutto", 0),
                      total: Pair("Totale", 32),
                    ),
                  )),
        ],
      ),
    ],
  );

  static TeamDetail detailTeamMock = TeamDetail(
    totalPoints: 886,
    days: [
      MatchDay(day: 1, points: 110, players: mockPlayers),
      MatchDay(day: 2, points: 70, players: mockPlayers),
      MatchDay(day: 3, points: 78, players: mockPlayers),
      MatchDay(day: 4, points: 90, players: mockPlayers),
      MatchDay(day: 5, points: 87, players: mockPlayers),
      MatchDay(day: 6, points: 68, players: mockPlayers),
      MatchDay(day: 7, points: 99, players: mockPlayers),
      MatchDay(day: 8, points: 102, players: mockPlayers),
      MatchDay(day: 9, points: 94, players: mockPlayers),
      MatchDay(day: 10, points: 88, players: mockPlayers),
    ],
  );
}
