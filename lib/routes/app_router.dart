import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:auto_route/annotations.dart';
import 'package:fantabasket_app_flutter/ui/pages/best_players_page.dart';
import 'package:fantabasket_app_flutter/ui/pages/completion_page.dart';
import 'package:fantabasket_app_flutter/ui/pages/container_page.dart';
import 'package:fantabasket_app_flutter/ui/pages/core_page.dart';
import 'package:fantabasket_app_flutter/ui/pages/create_team.dart';
import 'package:fantabasket_app_flutter/ui/pages/load_stages_page.dart';
import 'package:fantabasket_app_flutter/ui/pages/login_page.dart';
import 'package:fantabasket_app_flutter/ui/pages/main_page.dart';
import 'package:fantabasket_app_flutter/ui/pages/pdf_viewer_page.dart';
import 'package:fantabasket_app_flutter/ui/pages/player_detail_page.dart';
import 'package:fantabasket_app_flutter/ui/pages/players_page.dart';
import 'package:fantabasket_app_flutter/ui/pages/profile_page.dart';
import 'package:fantabasket_app_flutter/ui/pages/rank_detail_page.dart';
import 'package:fantabasket_app_flutter/ui/pages/rank_page.dart';
import 'package:fantabasket_app_flutter/ui/pages/registration_page.dart';
import 'package:fantabasket_app_flutter/ui/pages/select_team_page.dart';
import 'package:fantabasket_app_flutter/ui/pages/team_detail_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(page: EmptyRouterPage, path: '/', children: [
    AutoRoute(
      page: MainPage,
      path: '',
    ),
    AutoRoute(page: LoginPage, path: 'login'),
    AutoRoute(page: RegistrationPage, path: 'registration'),
    AutoRoute(page: CorePage, path: 'core', children: [
      AutoRoute(
          page: EmptyRouterScreen,
          path: 'container',
          name: 'TopBarContainerRouter',
          children: [
            AutoRoute(
              page: ContainerPage,
              path: '',
            ),
          ]),
      AutoRoute(page: CreateTeamPage, path: 'create_team_page'),
      AutoRoute(page: RankPage, path: 'rank_page'),
      AutoRoute(page: PlayersPage, path: 'players_page'),
      AutoRoute(page: ProfilePage, path: 'profile_page'),
    ]),
    AutoRoute(page: LoadStagesPage, path: 'load_stages_page'),
    AutoRoute(page: PdfViewerPage, path: 'pdf_viewer_page'),
    AutoRoute(page: SelectTeamPage, path: 'select_team_page'),
    AutoRoute(page: CompletionPage, path: 'completion_page'),
    AutoRoute(page: RankDetailPage, path: 'rank_detail_page'),
    AutoRoute(page: TeamDetailPage, path: 'team_detail_page'),
    AutoRoute(page: PlayerDetailPage, path: 'player_detail_page'),
    AutoRoute(page: BestPlayersPage, path: 'best_players_page'),
  ])

  /*
  ,*/
])
class $AppRouter {}
