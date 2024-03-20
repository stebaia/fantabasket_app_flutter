import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:fantabasket_app_flutter/utils/dismiss_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatefulWidget {
  App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _router = AppRouter();

  /*DarkThemeProvider themeProvider = new DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeProvider.darkTheme =
        await themeProvider.darkThemePreferences.getTheme();
  */

  @override
  void initState() {
    super.initState();
    //getCurrentAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return DependencyInjector(
        child: DismissKeyboard(
            child: SafeArea(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.sen().fontFamily,
          useMaterial3: true,
        ),
        localizationsDelegates: [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('it'), // Italian
        ],
        routeInformationParser: _router.defaultRouteParser(),
        routerDelegate: _router.delegate(),
      ),
    )));
  }
}
