import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/ui/widgets/rank_card.dart';
import 'package:fantabasket_app_flutter/ui/widgets/sponsors_banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RankPage extends StatefulWidget {
  static const Map<String, int> mockList = {
    "Bologna": 1,
    "Forli": 5,
    "Cesena": 2,
    "Rimini": 4,
    "Padova": 3,
    "Reggio Emilia": 8,
    "Firenze": 1,
    "Novara": 2,
    "Torino": 7,
    "Brescia": 5,
  };
  const RankPage({super.key});

  @override
  State<RankPage> createState() => _RankPageState();
}

class _RankPageState extends State<RankPage> {
  late Map<String, int> _list;

  @override
  void initState() {
    super.initState();
    _list = {};
    for (var el in RankPage.mockList.entries) {
      _list[el.key] = el.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);

    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SponsorsBanner(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Text(
              "Classifiche",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: darkMode.darkTheme ? Colors.white : Colors.black,
                fontSize: 25,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 2.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                focusColor: Theme.of(context).colorScheme.background,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.background,
                    width: 2.0,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: 'Inserisci nome...',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 173, 173, 173),
                ),
              ),
              cursorColor: const Color.fromARGB(255, 173, 173, 173),
              style: TextStyle(
                  color: darkMode.darkTheme ? Colors.white : Colors.black),
              textAlignVertical: TextAlignVertical.center,
              onChanged: (value) {
                setState(() {
                  _list = {};
                  for (var el in RankPage.mockList.entries) {
                    _list[el.key] = el.value;
                  }
                  _list.removeWhere((k, v) =>
                      !(k.toLowerCase()).contains(value.toLowerCase()));
                });
              },
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ..._list.entries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      child: RankingCard(entry: entry),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
