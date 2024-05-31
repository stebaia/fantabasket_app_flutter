import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/player_detail_bloc/player_detail_bloc.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/ui/widgets/double_spinner.dart';
import 'package:fantabasket_app_flutter/ui/widgets/player_stages_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlayerDetailPage extends StatelessWidget with AutoRouteWrapper {
  final int id;
  final String firstName;
  final String lastName;
  final String photo;
  final String category;

  const PlayerDetailPage({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.photo,
    required this.category,
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
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          '$firstName $lastName',
          style: const TextStyle(color: Colors.white, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
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
                      ),
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.01),
                      Container(
                        width: 150,
                        height: 120,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1.0),
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            photo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                   
                    Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8),
                          height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: darkMode.darkTheme
                                  ? Colors.white70
                                  : Color.fromARGB(197, 208, 203, 203))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.layerGroup, color: darkMode.darkTheme
                                    ? Colors.white
                                    : Colors.black,),
                          SizedBox(height: 4,),
                          Text(category, style: TextStyle(
                                fontFamily: 'Poppins',
                                color: darkMode.darkTheme
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),),
                                SizedBox(height: 4,),
                          Text(
                            'Categoria',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: darkMode.darkTheme
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 12,
                                ),
                          )
                        ],
                      ),
                    )),
                    Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(4),
                          height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: darkMode.darkTheme
                                  ? Colors.white70
                                  : Color.fromARGB(197, 208, 203, 203))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.peopleGroup, color: darkMode.darkTheme
                                    ? Colors.white
                                    : Colors.black,),
                          SizedBox(height: 4,),
                          Text(pd.stages!.first.team ?? "Squadra non disponibile...", style: TextStyle(
                                fontFamily: 'Poppins',
                                overflow: TextOverflow.ellipsis,
                                color: darkMode.darkTheme
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),),
                                SizedBox(height: 4,),
                          Text(
                            'Squadra',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: darkMode.darkTheme
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 12,
                                ),
                          )
                        ],
                      ),
                    )),
                    Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8),
                          height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: darkMode.darkTheme
                                  ? Colors.white70
                                  : Color.fromARGB(197, 208, 203, 203))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.basketball, color: darkMode.darkTheme
                                    ? Colors.white
                                    : Colors.black,),
                          SizedBox(height: 4,),
                          Text(pd.stages == null
                                  ? "0"
                                  : pd.stages!
                                      .map((s) => s.points)
                                      .reduce(
                                          (value, element) => value + element)
                                      .toString(), style: TextStyle(
                                fontFamily: 'Poppins',
                                color: darkMode.darkTheme
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),),
                                SizedBox(height: 4,),
                          Text(
                            'Punti totali',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: darkMode.darkTheme
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 12,
                                ),
                          )
                        ],
                      ),
                    ))
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
          ErrorPlayerDetailState(errorString: var errorString) => Center(
              child: Text(errorString),
            ),
          _ => Container(),
        };
      }),
    );
  }
}
