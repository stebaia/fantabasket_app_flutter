import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/player_in_rank.dart';
import 'package:flutter/material.dart';

class Constants {
  const Constants._();

  static const userKey = 'CURRENT_USER';
  static const regexEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static const baseUrl = "https://fantabasket.talkandprofit.net/";

  static const loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer et arcu lectus. Nam vestibulum massa sit amet tortor dignissim dignissim. Etiam blandit efficitur risus vel sollicitudin. Maecenas eu turpis ornare, dignissim mi pharetra, placerat lectus. Fusce eget lorem porttitor, vestibulum velit vitae, pretium nisl. Phasellus efficitur sed arcu et tincidunt. Pellentesque in ipsum eros. Sed interdum tristique sapien. Interdum et malesuada fames ac ante ipsum primis in faucibus. In hac habitasse platea dictumst.Phasellus quis placerat eros. Pellentesque ullamcorper pharetra fringilla. Aenean eget ligula ut enim laoreet tincidunt. Donec eu urna mi. Fusce ac mattis est. Morbi ac fermentum enim. Nunc tempor ultricies nunc. Maecenas iaculis pharetra rutrum. Sed feugiat fringilla ante at eleifend.Nulla tellus arcu, volutpat ac nulla at, blandit venenatis nunc. Praesent at tellus orci. Donec porttitor magna dolor, id consequat lectus ultricies ut. Phasellus a tellus faucibus est dictum blandit. Praesent consectetur malesuada bibendum. Donec ac elit in ipsum sollicitudin gravida eget non enim. Nulla facilisi. Etiam leo eros, consequat at porta non, luctus sit amet dolor. Pellentesque vestibulum vestibulum dolor, id rutrum nibh scelerisque elementum.Suspendisse potenti. Cras aliquam posuere purus ut mollis. Vivamus arcu elit, laoreet sed nisl nec, congue efficitur urna. Donec ac tempus nunc, sit amet aliquam ex. Donec ac mi sagittis, fringilla metus sed, luctus enim. Integer viverra tempor velit, eget tristique nunc efficitur in. Morbi dolor elit, condimentum sit amet justo vel, bibendum scelerisque mi. Integer interdum, ex et auctor volutpat, nisl nunc sollicitudin orci, et vehicula magna mi sed mauris. Ut dolor lacus, faucibus in dapibus ac, euismod sed velit. Mauris maximus convallis magna, non dictum magna pharetra quis. Aenean rhoncus scelerisque enim, ac tempus orci blandit ut.Quisque cursus dictum neque, sodales dignissim lorem viverra nec. Sed ornare ex eu dui blandit, vitae maximus eros tristique. Suspendisse rutrum nisl arcu, in feugiat nunc vehicula ac. Donec dapibus commodo vestibulum. Etiam vel mi at elit congue pulvinar. Cras dapibus lectus gravida tristique cursus. Donec id lorem pulvinar velit dapibus scelerisque.";

  static Map<String, Color> categoryColors = {
    'A': const Color.fromARGB(255, 233, 75, 64),
    'B': const Color.fromARGB(255, 194, 155, 27),
    'C1': const Color.fromARGB(255, 115, 177, 60),
    'C2': const Color.fromARGB(255, 66, 152, 69),
    'D': const Color.fromARGB(255, 57, 166, 193),
    'P': const Color.fromARGB(255, 38, 110, 169),
    'F': const Color.fromARGB(255, 145, 48, 183),
  };

  static Map<String, int> categoryValues = {
    'A': 25,
    'B': 20,
    'C1': 15,
    'C2': 10,
    'D': 10,
    'P': 5,
    'F': 0,
  };

  static List<Player> detailTeamMock = [
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
    ),
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
    ),
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
    ),
    const Player(
      id: 4,
      firstName: "ALberto",
      lastName: "Angela",
      value: 10,
      team: "",
      photo: "",
      phone: "",
      category: "A",
      email: "",
    ),
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
    ),
  ];

  static List<PlayerInRank> rankDetailMock = [
    const PlayerInRank(
      firstName: "Mario",
      lastName: "Rossi",
      teamName: "JoyBoys",
      points: 1100,
      position: 1,
    ),
    const PlayerInRank(
      firstName: "Luca",
      lastName: "Verdi",
      teamName: "PatRileyRitirati",
      points: 890,
      position: 2,
    ),
    const PlayerInRank(
      firstName: "Alberto",
      lastName: "Angela",
      teamName: "I pesciazzi",
      points: 670,
      position: 3,
    ),
    const PlayerInRank(
      firstName: "Luigi",
      lastName: "Bianchi",
      teamName: "Potatoes",
      points: 540,
      position: 4,
    ),
    const PlayerInRank(
      firstName: "Ciro",
      lastName: "Esposito",
      teamName: "Maria maria",
      points: 330,
      position: 5,
    ),
    const PlayerInRank(
      firstName: "Emanuele",
      lastName: "Lamagna",
      teamName: "Pedonis",
      points: 290,
      position: 6,
    ),
    const PlayerInRank(
      firstName: "Gianmarco",
      lastName: "Balza",
      teamName: "Yoyos",
      points: 150,
      position: 7,
    ),
    const PlayerInRank(
      firstName: "Mario",
      lastName: "Rossi",
      teamName: "JoyBoys",
      points: 140,
      position: 8,
    ),
    const PlayerInRank(
      firstName: "Luca",
      lastName: "Laurenti",
      teamName: "Pappinos",
      points: 130,
      position: 9,
    ),
    const PlayerInRank(
      firstName: "Angelo",
      lastName: "Pintus",
      teamName: "BlablaCard",
      points: 100,
      position: 10,
    ),
    const PlayerInRank(
      firstName: "Simone",
      lastName: "Lodi",
      teamName: "Lodolodo",
      points: 50,
      position: 11,
    ),
  ];
}
