import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

class ColorUtils {
  static Color getColor(String category) {
    return Constants.categoryColors[category]!;
  }
}
