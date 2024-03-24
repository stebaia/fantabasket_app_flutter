import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/rank_detail_bloc/rank_detail_bloc.dart';
import 'package:fantabasket_app_flutter/ui/widgets/rank_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RankDetailPage extends StatelessWidget with AutoRouteWrapper {
  final String stageName;

  const RankDetailPage({
    required this.stageName,
    super.key,
  });

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<RankDetailBloc>(
            create: ((context) => RankDetailBloc()..getRanking()),
          ),
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 14, 13, 13),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 14, 13, 13),
        title: Text(
          stageName,
          style: const TextStyle(fontSize: 18),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Text(
              "Classifica",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 225, 135, 57),
                fontSize: 25,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<RankDetailBloc, RankDetailState>(
                builder: (BuildContext context, RankDetailState state) {
              return switch (state) {
                TryGetRanking() => const Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  )),
                ResultRankingState() => ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.players.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        child: RankDetailCard(player: state.players[index]),
                      );
                    },
                  ),
                _ => Container(),
              };
            }),
          )
        ],
      ),
    );
  }
}
