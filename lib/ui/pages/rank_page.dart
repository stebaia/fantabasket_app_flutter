import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/banner_bloc/banner_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/create_team_bloc/create_team_bloc.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/ui/widgets/double_spinner.dart';
import 'package:fantabasket_app_flutter/ui/widgets/rank_card.dart';
import 'package:fantabasket_app_flutter/ui/widgets/sponsors_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RankPage extends StatefulWidget with AutoRouteWrapper {
  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<CreateTeamBloc>(
            create: ((context) =>
                CreateTeamBloc(stagesRepository: context.read())..getStages()),
          ),
          BlocProvider<BannerBloc>(
            create: ((context) =>
                BannerBloc(repository: context.read())..getBannerList()),
          )
        ],
        child: this,
      );

  const RankPage({super.key});

  @override
  State<RankPage> createState() => _RankPageState();
}

class _RankPageState extends State<RankPage> {
  late List<Stage> _list;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);

    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<BannerBloc, BannerState>(
            builder: (context, state) {
              if (state is TryGetBannerState) {
                return const SponsorsBannerBlank();
              } else if (state is ResultBannerListState) {
                return SponsorsBanner(banner: state.bannerList.banners![0]);
              } else {
                return const SponsorsBannerBlank();
              }
            },
          ),
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
          BlocBuilder<CreateTeamBloc, CreateTeamState>(
              builder: (context, state) {
            if (state is ResultGetStagesState) {
              return Padding(
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
                      color: darkMode.darkTheme ? Colors.white : Colors.black),
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: (value) => setState(() {}),
                ),
              );
            } else {
              return Container();
            }
          }),
          Expanded(
            child: BlocBuilder<CreateTeamBloc, CreateTeamState>(
              builder: (context, state) {
                if (state is TryGetStagesState) {
                  return const Center(
                    child: DoubleSpinner(),
                  );
                } else if (state is ErrorGetStagesState) {
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
                  _list = (state as ResultGetStagesState)
                      .stagesList
                      .stages!
                      .where((stage) => stage.fieldName!
                          .toLowerCase()
                          .contains(_controller.text.toLowerCase()))
                      .toList();
                  return Column(
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
                                  itemBuilder: (context, index) =>
                                      RankingCard(stage: _list[index]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
