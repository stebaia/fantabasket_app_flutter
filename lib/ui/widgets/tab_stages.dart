import 'package:fantabasket_app_flutter/bloc/banner_bloc/banner_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/create_team_bloc/create_team_bloc.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/ui/widgets/double_spinner.dart';
import 'package:fantabasket_app_flutter/ui/widgets/players_list_card.dart';
import 'package:fantabasket_app_flutter/ui/widgets/sponsors_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TabStages extends StatelessWidget {
  final DarkThemeProvider darkMode;

  const TabStages({
    required this.darkMode,
    super.key,
  });

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
              color: darkMode.darkTheme ? Colors.white : Colors.black,
            ),
            textAlignVertical: TextAlignVertical.center,
            onChanged: (value) {},
          ),
        ),
        Expanded(
          child: BlocBuilder<CreateTeamBloc, CreateTeamState>(
            builder: (context, state) {
              if (state is ErrorGetStagesState) {
                return const Center(
                  child: Text("Errore nel caricamento delle tappe"),
                );
              } else if (state is EmptyGetStagesState) {
                return Column(
                  children: [
                    BlocBuilder<BannerBloc, BannerState>(
                      builder: (context, state) {
                        if (state is TryGetBannerState) {
                          return const SponsorsBannerBlank();
                        } else if (state is ResultBannerListState) {
                          return SponsorsBanner(
                              banner: state.bannerList.banners![0]);
                        } else {
                          return const SponsorsBannerBlank();
                        }
                      },
                    ),
                    const Center(
                      child: Text("Nessuna tappa presente"),
                    ),
                  ],
                );
              } else {
                return Skeletonizer(
                  enabled: state is TryGetStagesState,
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
                                switch (state) {
                                  TryGetStagesState() => const Center(
                                      child: DoubleSpinner(),
                                    ),
                                  ResultGetStagesState(
                                    stagesList: var stages
                                  ) =>
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: stages.count,
                                      itemBuilder: (context, index) =>
                                          PlayersListCard(
                                              stage: stages.stages![index]),
                                    ),
                                  _ => ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 4,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return const PlayersListCard(
                                          stage: Stage(id: 0),
                                        );
                                      },
                                    ),
                                }
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
