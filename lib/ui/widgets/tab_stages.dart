import 'package:fantabasket_app_flutter/bloc/banner_bloc/banner_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/create_team_bloc/create_team_bloc.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/model/stages_list.dart';
import 'package:fantabasket_app_flutter/ui/widgets/double_spinner.dart';
import 'package:fantabasket_app_flutter/ui/widgets/players_list_card.dart';
import 'package:fantabasket_app_flutter/ui/widgets/sponsors_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabStages extends StatefulWidget {
  final DarkThemeProvider darkMode;
  final StagesList list;

  const TabStages({
    required this.darkMode,
    required this.list,
    super.key,
  });

  @override
  State<TabStages> createState() => _TabStagesState();
}

class _TabStagesState extends State<TabStages> {
  late List<Stage> _list;
  late TextEditingController _controller;

  _updateList() {
    _list = widget.list.stages!
        .where((stage) => stage.fieldName!
            .toLowerCase()
            .contains(_controller.text.toLowerCase()))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    _list = widget.list.stages!;
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 2.0,
          ),
          child: TextField(
            controller: _controller,
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
              color: widget.darkMode.darkTheme ? Colors.white : Colors.black,
            ),
            textAlignVertical: TextAlignVertical.center,
            onChanged: (value) => setState(() => _updateList()),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _list.length,
                          itemBuilder: (context, index) => PlayersListCard(
                            stage: _list[index],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
