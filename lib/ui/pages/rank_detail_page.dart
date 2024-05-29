import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/bloc/rank_detail_bloc/rank_detail_bloc.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/ui/components/empty_component.dart';
import 'package:fantabasket_app_flutter/ui/widgets/double_spinner.dart';
import 'package:fantabasket_app_flutter/ui/widgets/rank_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class RankDetailPage extends StatelessWidget with AutoRouteWrapper {
  final Stage stage;

  const RankDetailPage({
    required this.stage,
    super.key,
  });

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<RankDetailBloc>(
            create: ((context) => RankDetailBloc(teamRepository: context.read())
              ..getRanking(stage.id)),
          ),
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        foregroundColor: darkMode.darkTheme ? Colors.white : Colors.black,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          stage.fieldName ?? "Nome non disponibile",
          style: const TextStyle(fontSize: 18),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Text(
              "Classifica",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: darkMode.darkTheme ? Colors.white : Colors.black,
                fontSize: 25,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<RankDetailBloc, RankDetailState>(
                builder: (BuildContext context, RankDetailState state) {
              return switch (state) {
                TryGetRanking() => const Center(child: DoubleSpinner()),
                ResultRankingState() => ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                        indent: 15, //spacing at the start of divider
                        endIndent: 20),
                    shrinkWrap: true,
                    itemCount: state.players.count,
                    itemBuilder: (context, index) {
                      return RankDetailCard(
                        player: state.players.teams![index],
                        position: index + 1,
                        owner: state.players.teams![index].owner!,
                      );
                    },
                  ),
                _ => const EmptyComponent(
                    text: "Al momento non ci sono squadre...",
                  )
              };
            }),
          )
        ],
      ),
    );
  }
}
