import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/model/players_list.dart';
import 'package:fantabasket_app_flutter/ui/widgets/best_players_card.dart';
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

class _TabGeneralState extends State<TabGeneral> {
  late List<Player> _list;
  late TextEditingController _controller;

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
  }

  Color getTransparentColor(Color color, double opacity) {
    return color.withOpacity(opacity);
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Container(
            height: 40,
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                prefixIcon: Icon(CupertinoIcons.search),
                contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                focusColor: const Color.fromARGB(137, 158, 158, 158),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.background,
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(137, 158, 158, 158),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                hintText: 'Cerca..',
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 173, 173, 173),
                ),
              ),
              cursorColor: const Color.fromARGB(255, 173, 173, 173),
              style: TextStyle(
                color: widget.darkMode.darkTheme ? Colors.white : Colors.black,
              ),
              textAlignVertical: TextAlignVertical.center,
              onChanged: (value) => setState(() => _updateList()),
            ),
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
                            title: Text(
                              '${_list[index].firstName} ${_list[index].lastName}',
                              style: TextStyle(
                                  color: darkMode.darkTheme
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
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
