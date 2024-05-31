import 'package:carousel_slider/carousel_slider.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/malus.dart';
import 'package:fantabasket_app_flutter/model/match_day.dart';
import 'package:fantabasket_app_flutter/model/player_match.dart';
import 'package:fantabasket_app_flutter/model/players_stats_list.dart';
import 'package:fantabasket_app_flutter/model/stage_stats.dart';
import 'package:fantabasket_app_flutter/ui/components/empty_component.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:fantabasket_app_flutter/model/player_detail.dart';
import 'package:fantabasket_app_flutter/model/player_stage.dart';
import 'package:fantabasket_app_flutter/model/bonus.dart';
import 'package:flutter/material.dart';
import 'package:pair/pair.dart';
import 'package:provider/provider.dart';

class PlayerStagesCarousel extends StatefulWidget {
  final PlayersStatsList playerDetail;

  const PlayerStagesCarousel({
    required this.playerDetail,
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _PlayerStagesCarouselState();
  }
}

class _PlayerStagesCarouselState extends State<PlayerStagesCarousel> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  late Iterable<MapEntry<int, StageStats>> indicators;

  Widget _getBonusMalus(
    bool bonus,
    List<Pair<String, String>> props,
    int total,
  ) {
    props.add(Pair("Totale", total.toString()));
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
            color: bonus
                ? const Color.fromARGB(255, 63, 160, 66)
                : const Color.fromARGB(255, 210, 43, 31)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                bonus ? "Bonus" : "Malus",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito Sans',
                  color: Colors.white,
                ),
              ),
            ),
            ...props.map(
              (pair) => Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    if (pair.key == "Totale") const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 11,
                          child: Text(
                            pair.key,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: pair.key == "Totale"
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontFamily: 'Nunito Sans',
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            pair.value,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: pair.key == "Totale"
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontFamily: 'Nunito Sans',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getStageTitle(
    StageStats stage,
    DarkThemeProvider darkMode,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stage.stageName,
                  style: TextStyle(
                    color: darkMode.darkTheme ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    indicators = widget.playerDetail.stages!.asMap().entries;
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);
    final bool isThereStage = widget.playerDetail.stages != null &&
        widget.playerDetail.stages!.isNotEmpty;
    return !isThereStage
        ? const EmptyComponent(text: "Nessuna tappa disponibile")
        : Column(
            children: [
              Expanded(
                flex: 10,
                child: CarouselSlider(
                  carouselController: _controller,
                  options: CarouselOptions(
                    height: double.infinity,
                    enableInfiniteScroll: false,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) =>
                        setState(() => _current = index),
                  ),
                  items: widget.playerDetail.stages!.map((stage) {
                    final areThereMatches = stage.matches.isNotEmpty;
                    return Builder(
                      builder: (BuildContext context) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            color: Theme.of(context).colorScheme.primary,
                            elevation: 2,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(20),
                              child: !areThereMatches
                                  ? Column(
                                      children: [
                                        _getStageTitle(stage, darkMode),
                                        const Expanded(
                                          child: Center(
                                            child: Text(
                                                "Nessuna giornata caricata"),
                                          ),
                                        )
                                      ],
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: areThereMatches
                                          ? stage.matches.length + 1
                                          : 2,
                                      itemBuilder: (context, index) {
                                        final PlayerMatch? playerMatch =
                                            index == 0
                                                ? null
                                                : areThereMatches
                                                    ? stage.matches
                                                        .asMap()
                                                        .entries
                                                        .firstWhere((entry) =>
                                                            entry.key ==
                                                            index - 1)
                                                        .value
                                                    : null;
                                        final Bonus? bonus = playerMatch?.bonus;
                                        final Malus? malus = playerMatch?.malus;
                                        return index == 0
                                            ? _getStageTitle(stage, darkMode)
                                            : Card(
                                                elevation: 4,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                child: ExpansionTile(
                                                  shape: const Border(),
                                                  title: Text(
                                                    playerMatch!.day,
                                                    style: TextStyle(
                                                        color:
                                                            darkMode.darkTheme
                                                                ? Colors.white
                                                                : Colors.black),
                                                  ),
                                                  iconColor: darkMode.darkTheme
                                                      ? Colors.white
                                                      : Colors.black,
                                                  collapsedIconColor:
                                                      darkMode.darkTheme
                                                          ? Colors.white
                                                          : Colors.black,
                                                  children: [
                                                    _getBonusMalus(
                                                      true,
                                                      bonus!.props,
                                                      playerMatch!.points,
                                                    ),
                                                    _getBonusMalus(
                                                      false,
                                                      malus!.props,
                                                      playerMatch.points,
                                                    ),
                                                  ],
                                                ),
                                              );
                                      },
                                    ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: PageViewDotIndicator(
                    currentItem: _current,
                    count: indicators.length,
                    unselectedColor: Colors.grey.withOpacity(0.4),
                    selectedColor: Theme.of(context).colorScheme.background,
                    size: const Size(12, 12),
                    unselectedSize: const Size(9, 9),
                  ),
                ),
              ),
            ],
          );
  }
}
