import 'package:fantabasket_app_flutter/bloc/cubit/credits_cubit/credits_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/select_player_bloc/select_player_bloc.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/ui/widgets/player_bar.dart';
import 'package:fantabasket_app_flutter/ui/widgets/players_bottom_sheet.dart';
import 'package:fantabasket_app_flutter/utils/color_utils.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerIcon extends StatefulWidget {
  final List<Player> players;

  final BuildContext mContext;

  const PlayerIcon({
    required this.players,
    required this.mContext,
    super.key,
  });

  @override
  State<PlayerIcon> createState() => _PlayerIconState();
}

class _PlayerIconState extends State<PlayerIcon> {
  Player? selected;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.7;
    return GestureDetector(
      onTap: () async {
        var selectedPlayer = await showModalBottomSheet<Player>(
          context: context,
          isScrollControlled: true,
          backgroundColor: Color.fromARGB(255, 14, 13, 13),
          builder: (BuildContext context) {
            return PlayersBottomSheet(
              mContext: widget.mContext,
              players: widget.players,
              selected: selected,
            );
          },
        );
        if (selectedPlayer != null && selectedPlayer != selected) {
          setState(() => selected = selectedPlayer);
        }
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.32,
        height: MediaQuery.of(context).size.height * 0.26,
        child: Card(
          color: Color.fromARGB(255, 14, 13, 13),
          elevation: 4,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.32,
                height: MediaQuery.of(context).size.height * 0.25,
                child: selected != null
                    ? Column(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.32,
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: selected!.photo != ''
                                      ? Image.network(
                                          selected!.photo,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.network(
                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/LeBron_James_%2851959977144%29_%28cropped2%29.jpg/640px-LeBron_James_%2851959977144%29_%28cropped2%29.jpg',
                                          fit: BoxFit.cover))),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                                color: ColorUtils.getColor(selected!),
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  selected!.firstName,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  selected!.lastName,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  selected!.value.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.add,
                              size: MediaQuery.of(context).size.width * 0.13,
                              color: Theme.of(context).colorScheme.primary),
                          const SizedBox(height: 5),
                          Text(
                            selected == null
                                ? "Seleziona giocatore\n"
                                : "${selected!.firstName} ${selected!.lastName}\n",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
