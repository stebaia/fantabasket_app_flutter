import 'package:carousel_slider/carousel_slider.dart';
import 'package:fantabasket_app_flutter/model/malus.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:fantabasket_app_flutter/model/player_detail.dart';
import 'package:fantabasket_app_flutter/model/player_stage.dart';
import 'package:fantabasket_app_flutter/model/bonus.dart';
import 'package:flutter/material.dart';
import 'package:pair/pair.dart';

class PlayerStagesCarousel extends StatefulWidget {
  final PlayerDetail playerDetail;

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
  late Iterable<MapEntry<int, PlayerStage>> indicators;

  Widget _getBonusMalus(
    bool bonus,
    List<Pair<String, int>> props,
  ) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
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
                          flex: 12,
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
                          flex: 1,
                          child: Text(
                            pair.value.toString(),
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

  @override
  void initState() {
    super.initState();
    indicators = widget.playerDetail.stages.asMap().entries;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            items: widget.playerDetail.stages.map((stage) {
              return Builder(
                builder: (BuildContext context) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      color: const Color.fromARGB(255, 49, 47, 47),
                      elevation: 4,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(20),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: stage.matches.length + 1,
                          itemBuilder: (context, index) {
                            final Bonus? bonus = index == 0
                                ? null
                                : stage.matches
                                    .firstWhere(
                                        (match) => match.dayNumber == index - 1)
                                    .bonus;
                            final Malus? malus = index == 0
                                ? null
                                : stage.matches
                                    .firstWhere(
                                        (match) => match.dayNumber == index - 1)
                                    .malus;
                            return index == 0
                                ? Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 70,
                                          height: 70,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: stage.stage.photo != ''
                                                ? Image.network(
                                                    stage.stage.photo!,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.network(
                                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/LeBron_James_%2851959977144%29_%28cropped2%29.jpg/640px-LeBron_James_%2851959977144%29_%28cropped2%29.jpg',
                                                    fit: BoxFit.cover),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                stage.stage.fieldName ??
                                                    "Nome non disponiible",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                                maxLines: 3,
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                stage.stage.city ??
                                                    "Nome non disponiible",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Card(
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                            top: 12,
                                            bottom: 2,
                                          ),
                                          child: const Text(
                                            "Giornata 0",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Nunito Sans',
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        _getBonusMalus(true, bonus!.props),
                                        _getBonusMalus(false, malus!.props)
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
              selectedColor: const Color.fromARGB(255, 225, 135, 57),
              size: const Size(12, 12),
              unselectedSize: const Size(9, 9),
            ),
          ),
        ),
      ],
    );
  }
}
