import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/player_detail_bloc/player_detail_bloc.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/ui/widgets/double_spinner.dart';
import 'package:fantabasket_app_flutter/ui/widgets/player_stages_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class PlayerDetailPage extends StatelessWidget with AutoRouteWrapper {
  final int id;
  final String firstName;
  final String lastName;

  const PlayerDetailPage({
    required this.id,
    required this.firstName,
    required this.lastName,
    super.key,
  });

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<PlayerDetailBloc>(
            create: ((context) =>
                PlayerDetailBloc(playerRepository: context.read())
                  ..getPlayerDetail(id)),
          ),
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        foregroundColor: darkMode.darkTheme ? Colors.white : Colors.black,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "$firstName $lastName",
          style: const TextStyle(fontSize: 18),
        ),
        automaticallyImplyLeading: true,
      ),
      body: BlocBuilder<PlayerDetailBloc, PlayerDetailState>(builder: (
        BuildContext context,
        PlayerDetailState state,
      ) {
        return switch (state) {
          TryPlayerDetailState() => const Center(
              child: DoubleSpinner(),
            ),
          ResultPlayerDetailState(playerStatsList: var pd) => Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      )),
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.01),
                      Container(
                        width: size.width * 0.25,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1.0),
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset(
                            'assets/images/player.jpeg',
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        '$firstName $lastName',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Squadra",
                              style: TextStyle(
                                color: darkMode.darkTheme
                                    ? Colors.white
                                    : Colors.black,
                                fontFamily: 'Nunito Sans',
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "Squadra",
                              style: TextStyle(
                                color: darkMode.darkTheme
                                    ? Colors.white
                                    : Colors.black,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Punti totali",
                              style: TextStyle(
                                color: darkMode.darkTheme
                                    ? Colors.white
                                    : Colors.black,
                                fontFamily: 'Nunito Sans',
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              "3900",
                              style: TextStyle(
                                color: darkMode.darkTheme
                                    ? Colors.white
                                    : Colors.black,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PlayerStagesCarousel(playerDetail: pd),
                  ),
                )
              ],
            ),
          _ => Container(),
        };
      }),
    );
  }
}
