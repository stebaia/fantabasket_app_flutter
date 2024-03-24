import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

class ColorUtils {
  static Color getColor(Player player) {
    String? category = player.category;
    print("Giocatore: $player");
    return Constants.categoryColors[category]!;
  }
}
