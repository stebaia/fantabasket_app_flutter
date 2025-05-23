import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:auto_route/annotations.dart';
import 'package:fantabasket_app_flutter/ui/pages/container_page.dart';
import 'package:fantabasket_app_flutter/ui/pages/core_page.dart';
import 'package:fantabasket_app_flutter/ui/pages/create_team.dart';
import 'package:fantabasket_app_flutter/ui/pages/login_page.dart';
import 'package:fantabasket_app_flutter/ui/pages/main_page.dart';
import 'package:fantabasket_app_flutter/ui/pages/profile_page.dart';
import 'package:fantabasket_app_flutter/ui/pages/rank_page.dart';
import 'package:fantabasket_app_flutter/ui/pages/registration_page.dart';

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
      AutoRoute(page: CreatTeamPage, path: 'create_team_page'),
      AutoRoute(page: RankPage, path: 'rank_page'),
      AutoRoute(page: ProfilePage, path: 'profile_page'),
    ]),
  ])

  /*
  ,*/
])
class $AppRouter {}
