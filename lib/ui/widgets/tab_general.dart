import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/players_list.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:fantabasket_app_flutter/ui/widgets/best_players_card.dart';
import 'package:fantabasket_app_flutter/ui/widgets/players_filters_dialog.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabGeneral extends StatefulWidget {
  final DarkThemeProvider darkMode;
  final PlayersList list;

  const TabGeneral({
    required this.darkMode,
    required this.list,
    super.key,
  });

  @override
  State<TabGeneral> createState() => _TabGeneralState();
}

enum Bonuses {
  puntiTotali,
  nessuno,
  puntoRealizzato,
  assists,
  stoppata,
  ankle,
  schiacciata,
  rimbalzo,
  abbigliamento,
}

class _TabGeneralState extends State<TabGeneral> {
  late List<Player> _list;
  late TextEditingController _controller;
  late String _filterName;

  _updateList() {
    _list = widget.list.players!
        .where((player) =>
            "${player.lastName} ${player.firstName}"
                .toLowerCase()
                .contains(_controller.text.toLowerCase()) ||
            player.team.toLowerCase().contains(_controller.text.toLowerCase()))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _list = widget.list.players!;
    _controller = TextEditingController();
    _filterName = "Punti totali";
  }

  Color getTransparentColor(Color color, double opacity) {
    return color.withOpacity(opacity);
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                flex: 8,
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(CupertinoIcons.search),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                      focusColor: const Color.fromARGB(137, 158, 158, 158),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.background,
                          width: 1.0,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(137, 158, 158, 158),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      hintText: 'Statistiche..',
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 173, 173, 173),
                      ),
                    ),
                    cursorColor: const Color.fromARGB(255, 173, 173, 173),
                    style: TextStyle(
                      color: widget.darkMode.darkTheme
                          ? Colors.white
                          : Colors.black,
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    onChanged: (value) => setState(() => _updateList()),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () async {
                      var result = await showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return PlayersFiltersDialog(
                              actualFilter: _filterName,
                            );
                          }) as String;
                      setState(() {
                        _filterName = result;
                        _list.sort((b, a) {
                          return switch (_filterName) {
                            "Punti totali" => a.value.compareTo(b.value),
                            "Punti realizzati" => a.points!.pointMade
                                .compareTo(b.points!.pointMade),
                            "Assist" =>
                              a.points!.assist.compareTo(b.points!.assist),
                            "Stoppate" =>
                              a.points!.block.compareTo(b.points!.block),
                            "Rimbalzi" =>
                              a.points!.bounce.compareTo(b.points!.bounce),
                            "Schiacciate" =>
                              a.points!.dunk.compareTo(b.points!.dunk),
                            "Ankle breaker" => a.points!.ankleBreaker
                                .compareTo(b.points!.ankleBreaker),
                            "Abbigliamento ignorante" => a
                                .points!.ignorantClothing
                                .compareTo(b.points!.ignorantClothing),
                            _ => -1,
                          };
                        });
                      });
                    },
                    icon: const Icon(Icons.filter_list),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
          child: Text(
            _filterName,
            textAlign: TextAlign.start,
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _list.length,
                      itemBuilder: (context, index) => ListTile(
                            onTap: () => context.pushRoute(
                              PlayerDetailRoute(
                                id: _list[index].id,
                                firstName: _list[index].firstName,
                                lastName: _list[index].lastName,
                                photo: _list[index].photo,
                                category: _list[index].category,
                              ),
                            ),
                            trailing: Container(
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: const Color.fromARGB(
                                          137, 158, 158, 158)),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  _list[index].value.toString(),
                                  style: TextStyle(
                                    color: darkMode.darkTheme
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            visualDensity:
                                const VisualDensity(horizontal: 0, vertical: 0),
                            leading: Container(
                                width: 60,
                                height: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    _list[index].photo,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            dense: true,
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${_list[index].firstName} ${_list[index].lastName}',
                                  style: TextStyle(
                                      color: darkMode.darkTheme
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  _list[index].team,
                                  style: TextStyle(
                                    color: darkMode.darkTheme
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                SizedBox(
                                    child: Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: getTransparentColor(
                                          Constants.categoryColors[
                                              _list[index].category]!,
                                          0.4)),
                                  child: Center(
                                      child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    _list[index].category,
                                    style: TextStyle(
                                        color: Constants.categoryColors[
                                            _list[index].category],
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )),
                                )),
                              ],
                            ),
                          )),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
