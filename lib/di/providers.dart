part of 'dependency_injector.dart';

final List<SingleChildWidget> _providers = [
  Provider<Logger>(create: (_) => Logger()),
  Provider<PrettyDioLogger>(
      create: (_) => PrettyDioLogger(
          requestBody: true, compact: true, requestHeader: true)),
  Provider<Dio>(
      create: (context) => Dio()
        ..interceptors
            .addAll([if (kDebugMode) context.read<PrettyDioLogger>()])),
  Provider<FlutterSecureStorage>(
    create: (_) => const FlutterSecureStorage(),
  ),
  Provider<UserService>(
    create: (context) =>
        UserService(context.read<Dio>(), baseUrl: Constants.baseUrl),
  ),
  Provider<PlayerService>(
    create: (context) =>
        PlayerService(context.read<Dio>(), baseUrl: Constants.baseUrl),
  ),
  Provider<StageService>(
    create: (context) =>
        StageService(context.read<Dio>(), baseUrl: Constants.baseUrl),
  ),
  Provider<TeamService>(
    create: (context) =>
        TeamService(context.read<Dio>(), baseUrl: Constants.baseUrl),
  ),
  ChangeNotifierProvider<DarkThemeProvider>(create: (_) => DarkThemeProvider()),
];

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

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreferences darkThemePreferences = DarkThemePreferences();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreferences.setDarkTheme(value);
    notifyListeners();
  }
}
