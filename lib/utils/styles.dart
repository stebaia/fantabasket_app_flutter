import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static ThemeData lightMode(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      fontFamily: GoogleFonts.sen().fontFamily,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        primary: Colors.white,
        secondary: const Color.fromARGB(255, 42, 49, 181),
        tertiary: const Color.fromARGB(255, 198, 32, 31),
        background: const Color.fromARGB(255, 31, 169, 193),
        seedColor: Colors.white,
      ),
    );
  }

  static ThemeData darkMode(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      fontFamily: GoogleFonts.sen().fontFamily,
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        primary: const Color.fromARGB(255, 14, 13, 13),
        secondary: const Color.fromARGB(255, 42, 49, 181),
        tertiary: const Color.fromARGB(255, 198, 32, 31),
        background: const Color.fromARGB(255, 31, 169, 193),
        seedColor: Colors.white,
      ),
    );
  }
}
