import 'package:fantabasket_app_flutter/ui/widgets/tab_general.dart';
import 'package:flutter/material.dart';

class PlayersFiltersDialog extends StatefulWidget {
  final String actualFilter;

  const PlayersFiltersDialog({
    super.key,
    required this.actualFilter,
  });

  @override
  State<PlayersFiltersDialog> createState() => _PlayersFiltersDialogState();
}

class _PlayersFiltersDialogState extends State<PlayersFiltersDialog> {
  late Bonuses _filterName;

  @override
  void initState() {
    super.initState();
    _filterName = switch (widget.actualFilter) {
      "Abbigliamento ignorante" => Bonuses.abbigliamento,
      "Ankle breaker" => Bonuses.ankle,
      "Assists" => Bonuses.assists,
      "Punti realizzati" => Bonuses.puntoRealizzato,
      "Stoppate" => Bonuses.stoppata,
      "Schiacciate" => Bonuses.schiacciata,
      "Rimbalzi" => Bonuses.rimbalzo,
      "Punti totali" => Bonuses.puntiTotali,
      _ => Bonuses.nessuno,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Expanded(
            flex: 3,
            child: Center(
              child: Text(
                "Filtri",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 15,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  RadioListTile<Bonuses>(
                    title: const Text('Punti totali'),
                    value: Bonuses.puntiTotali,
                    groupValue: _filterName,
                    activeColor: Colors.blue,
                    onChanged: (Bonuses? value) {
                      setState(() {
                        _filterName = value!;
                      });
                    },
                  ),
                  RadioListTile<Bonuses>(
                    title: const Text('Punti realizzati'),
                    value: Bonuses.puntoRealizzato,
                    groupValue: _filterName,
                    activeColor: Colors.blue,
                    onChanged: (Bonuses? value) {
                      setState(() {
                        _filterName = value!;
                      });
                    },
                  ),
                  RadioListTile<Bonuses>(
                    title: const Text('Assist'),
                    value: Bonuses.assists,
                    groupValue: _filterName,
                    activeColor: Colors.blue,
                    onChanged: (Bonuses? value) {
                      setState(() {
                        _filterName = value!;
                      });
                    },
                  ),
                  RadioListTile<Bonuses>(
                    title: const Text('Stoppate'),
                    value: Bonuses.stoppata,
                    groupValue: _filterName,
                    activeColor: Colors.blue,
                    onChanged: (Bonuses? value) {
                      setState(() {
                        _filterName = value!;
                      });
                    },
                  ),
                  RadioListTile<Bonuses>(
                    title: const Text('Rimbalzi'),
                    value: Bonuses.rimbalzo,
                    groupValue: _filterName,
                    activeColor: Colors.blue,
                    onChanged: (Bonuses? value) {
                      setState(() {
                        _filterName = value!;
                      });
                    },
                  ),
                  RadioListTile<Bonuses>(
                    title: const Text('Schiacciate'),
                    value: Bonuses.schiacciata,
                    groupValue: _filterName,
                    activeColor: Colors.blue,
                    onChanged: (Bonuses? value) {
                      setState(() {
                        _filterName = value!;
                      });
                    },
                  ),
                  RadioListTile<Bonuses>(
                    title: const Text('Ankle breaker'),
                    value: Bonuses.ankle,
                    groupValue: _filterName,
                    activeColor: Colors.blue,
                    onChanged: (Bonuses? value) {
                      setState(() {
                        _filterName = value!;
                      });
                    },
                  ),
                  RadioListTile<Bonuses>(
                    title: const Text('Abbigliamento ignorante'),
                    value: Bonuses.abbigliamento,
                    groupValue: _filterName,
                    activeColor: Colors.blue,
                    onChanged: (Bonuses? value) {
                      setState(() {
                        _filterName = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  var s = switch (_filterName) {
                    Bonuses.puntiTotali => "Punti totali",
                    Bonuses.nessuno => "Nessun filtro selezionato",
                    Bonuses.abbigliamento => "Abbigliamento ignorante",
                    Bonuses.ankle => "Ankle breaker",
                    Bonuses.assists => "Assists",
                    Bonuses.puntoRealizzato => "Punti realizzati",
                    Bonuses.stoppata => "Stoppate",
                    Bonuses.schiacciata => "Schiacciate",
                    Bonuses.rimbalzo => "Rimbalzi",
                  };
                  Navigator.pop(context, s);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.background,
                ),
                child: const Text(
                  "Conferma",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
