import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeHelper {
  static const backgroundColorDark = Color(0xff0D0D0D);
  static const backgroundColorGray = Color(0xff171A1E);
  static const colorUnselectedIcon = Color(0xffA2A4A8);
  static const sectionColor = Color(0xff212427);
  static const textSecondaryColor = Color(0xff637381);
  static const textPrimaryColor = Color(0xffE9E9E9);
  static const buttonRedColor = Color(0xffEB4335);
  static const enabledPrimaryColor = Color(0xff3da436);
  static const enabledPrimaryColorBackground =
      Color.fromARGB(78, 129, 231, 129);
  static const disabledActionColor = Color(0xff919EAB);
  static const disabledActionBackgroundColor = Color(0xff474d53);
  static const backgroundSectionSettings = Color(0xff2E3134);
  static const borderBoxColor = Color(0xff737373);
  static const backgroundColorWhiteTop = Color.fromARGB(255, 70, 70, 70);
  static const greenBackgroundColors = Color.fromARGB(171, 107, 233, 98);
}

class DarkThemePreferences {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}
