import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/banner_bloc/banner_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/create_team_bloc/create_team_bloc.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/ui/components/empty_component.dart';
import 'package:fantabasket_app_flutter/ui/widgets/double_spinner.dart';
import 'package:fantabasket_app_flutter/ui/widgets/rank_card.dart';
import 'package:fantabasket_app_flutter/ui/widgets/sponsors_banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
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
    final user = context.watch<AuthCubit>().state;
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
                return SponsorsBanner(banner: state.bannerModel);
              } else {
                return const SponsorsBannerBlank();
              }
            },
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Row(
              children: [
                Lottie.asset('assets/lottie/trophy.json',
                    width: 60, height: 60),
                Text(
                  "Ranking",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: darkMode.darkTheme ? Colors.white : Colors.black,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<CreateTeamBloc, CreateTeamState>(
              builder: (context, state) {
            if (state is ResultGetStagesState) {
              return Container(
                height: 40,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 2.0,
                ),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.search),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                    focusColor: Theme.of(context).colorScheme.background,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.background,
                        width: 1.0,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
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
                  return EmptyComponent(
                    text: "Al momento non ci sono tappe...",
                  );
                } else if (state is EmptyGetStagesState) {
                  return const EmptyComponent(
                      text:
                          "Nessuna tappa presente, attendi che vengano caricate dal nostro team!");
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
                                RefreshIndicator(
                                  onRefresh: () async {
                                    context.read<CreateTeamBloc>().getStages();
                                  },
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: _list.length,
                                    itemBuilder: (context, index) =>
                                        RankingCard(stage: _list[index]),
                                  ),
                                )
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
