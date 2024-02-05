import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/players_list.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/model/stages_list.dart';

class StagesRepository {
  StagesRepository();

  Future<StagesList> getStages() async {
    return StagesList(
      count: 3,
      stages: [
        Stage(
          1,
          "Cesena",
          "Campetto Case Finali",
          "Via Cesare Balbo, 9, 47521 Cesena FC",
          DateTime(2024, 3, 5, 21, 30),
          DateTime(2024, 2, 5, 15, 00),
          DateTime(2024, 3, 4, 15, 00),
        ),
        Stage(
          2,
          "Bologna",
          "Playground Meloncello",
          "Via Porrettana, 1833, 40135 Bologna BO",
          DateTime(2024, 3, 5, 21, 30),
          DateTime(2024, 2, 5, 15, 00),
          DateTime(2024, 3, 4, 15, 00),
        ),
        Stage(
          3,
          "Forlì",
          "Campetto Edelweiss",
          "Viale Fratelli Spazzoli, 113, 47121 Forlì FC",
          DateTime(2024, 3, 5, 21, 30),
          DateTime(2024, 2, 5, 15, 00),
          DateTime(2024, 3, 4, 15, 00),
        ),
        Stage(
          3,
          "Cervia",
          "Fantini Club",
          "Lungomare Grazia Deledda, 182, 48015 Cervia RA",
          DateTime(2024, 3, 5, 21, 30),
          DateTime(2024, 2, 5, 15, 00),
          DateTime(2024, 3, 4, 15, 00),
        ),
        Stage(
          4,
          "Firenze",
          "A.D. Dlf Firenze Basket",
          "Via Giovanni Paisiello, 131, 50144 Firenze FI",
          DateTime(2024, 3, 5, 21, 30),
          DateTime(2024, 2, 5, 15, 00),
          DateTime(2024, 3, 4, 15, 00),
        ),
        Stage(
          5,
          "Imola",
          "Grifo Basket",
          "Via Alfredo Oriani, 2/4, 40026 Imola BO",
          DateTime(2024, 3, 5, 21, 30),
          DateTime(2024, 2, 5, 15, 00),
          DateTime(2024, 3, 4, 15, 00),
        ),
      ],
    );
  }
}
