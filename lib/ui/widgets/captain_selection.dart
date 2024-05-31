import 'package:fantabasket_app_flutter/bloc/cubit/captain_cubit.dart/captain_cubit.dart';
import 'package:fantabasket_app_flutter/model/player.dart';
import 'package:fantabasket_app_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectCaptain extends StatelessWidget {
  final List<Player> team;

  const SelectCaptain({
    required this.team,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var players = team
        .map(
          (player) => BlocBuilder<CaptainCubit, CaptainState>(
            builder: (BuildContext context, CaptainState state) {
              var captain = context.read<CaptainCubit>().getCaptain();
              return CaptainCard(
                captain: captain,
                player: player,
              );
            },
          ),
        )
        .toList();
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [players[0], players[1], players[2]],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [players[3], players[4]],
          ),
        ],
      ),
    );
  }
}

class CaptainCard extends StatelessWidget {
  final Player? captain;
  final Player player;

  const CaptainCard({
    required this.captain,
    required this.player,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<CaptainCubit>().selectCaptain(player),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.29,
        height: MediaQuery.of(context).size.height * 0.2,
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: (captain == null || player.id != captain!.id)
                  ? Colors.white
                  : Theme.of(context).colorScheme.background,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: SizedBox(
                    width: double.infinity,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        child: player.photo != ''
                            ? Image.network(
                                player.photo,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/LeBron_James_%2851959977144%29_%28cropped2%29.jpg/640px-LeBron_James_%2851959977144%29_%28cropped2%29.jpg',
                                fit: BoxFit.cover))),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Constants.categoryColors[player.category],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "${player.lastName} ${player.firstName}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
