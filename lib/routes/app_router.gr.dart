// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:auto_route/empty_router_widgets.dart' as _i1;
import 'package:flutter/material.dart' as _i14;

import '../model/player.dart' as _i15;
import '../ui/pages/completion_page.dart' as _i8;
import '../ui/pages/container_page.dart' as _i12;
import '../ui/pages/core_page.dart' as _i5;
import '../ui/pages/create_team.dart' as _i9;
import '../ui/pages/load_stages_page.dart' as _i6;
import '../ui/pages/login_page.dart' as _i3;
import '../ui/pages/main_page.dart' as _i2;
import '../ui/pages/profile_page.dart' as _i11;
import '../ui/pages/rank_page.dart' as _i10;
import '../ui/pages/registration_page.dart' as _i4;
import '../ui/pages/select_team_page.dart' as _i7;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    EmptyRouterRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.MainPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i3.LoginPage()),
      );
    },
    RegistrationRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i4.RegistrationPage()),
      );
    },
    CoreRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.CorePage(),
      );
    },
    LoadStagesRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i6.LoadStagesPage()),
      );
    },
    SelectTeamRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i7.SelectTeamPage()),
      );
    },
    CompletionRoute.name: (routeData) {
      final args = routeData.argsAs<CompletionRouteArgs>();
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(
            child: _i8.CompletionPage(
          key: args.key,
          team: args.team,
          side: args.side,
        )),
      );
    },
    TopBarContainerRouter.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterScreen(),
      );
    },
    CreateTeamRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.CreateTeamPage(),
      );
    },
    RankRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.RankPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.ProfilePage(),
      );
    },
    ContainerRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.ContainerPage(),
      );
    },
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(
          EmptyRouterRoute.name,
          path: '/',
          children: [
            _i13.RouteConfig(
              MainRoute.name,
              path: '',
              parent: EmptyRouterRoute.name,
            ),
            _i13.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: EmptyRouterRoute.name,
            ),
            _i13.RouteConfig(
              RegistrationRoute.name,
              path: 'registration',
              parent: EmptyRouterRoute.name,
            ),
            _i13.RouteConfig(
              CoreRoute.name,
              path: 'core',
              parent: EmptyRouterRoute.name,
              children: [
                _i13.RouteConfig(
                  TopBarContainerRouter.name,
                  path: 'container',
                  parent: CoreRoute.name,
                  children: [
                    _i13.RouteConfig(
                      ContainerRoute.name,
                      path: '',
                      parent: TopBarContainerRouter.name,
                    )
                  ],
                ),
                _i13.RouteConfig(
                  CreateTeamRoute.name,
                  path: 'create_team_page',
                  parent: CoreRoute.name,
                ),
                _i13.RouteConfig(
                  RankRoute.name,
                  path: 'rank_page',
                  parent: CoreRoute.name,
                ),
                _i13.RouteConfig(
                  ProfileRoute.name,
                  path: 'profile_page',
                  parent: CoreRoute.name,
                ),
              ],
            ),
            _i13.RouteConfig(
              LoadStagesRoute.name,
              path: 'load_stages_page',
              parent: EmptyRouterRoute.name,
            ),
            _i13.RouteConfig(
              SelectTeamRoute.name,
              path: 'select_team_page',
              parent: EmptyRouterRoute.name,
            ),
            _i13.RouteConfig(
              CompletionRoute.name,
              path: 'completion_page',
              parent: EmptyRouterRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class EmptyRouterRoute extends _i13.PageRouteInfo<void> {
  const EmptyRouterRoute({List<_i13.PageRouteInfo>? children})
      : super(
          EmptyRouterRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'EmptyRouterRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i13.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.RegistrationPage]
class RegistrationRoute extends _i13.PageRouteInfo<void> {
  const RegistrationRoute()
      : super(
          RegistrationRoute.name,
          path: 'registration',
        );

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i5.CorePage]
class CoreRoute extends _i13.PageRouteInfo<void> {
  const CoreRoute({List<_i13.PageRouteInfo>? children})
      : super(
          CoreRoute.name,
          path: 'core',
          initialChildren: children,
        );

  static const String name = 'CoreRoute';
}

/// generated route for
/// [_i6.LoadStagesPage]
class LoadStagesRoute extends _i13.PageRouteInfo<void> {
  const LoadStagesRoute()
      : super(
          LoadStagesRoute.name,
          path: 'load_stages_page',
        );

  static const String name = 'LoadStagesRoute';
}

/// generated route for
/// [_i7.SelectTeamPage]
class SelectTeamRoute extends _i13.PageRouteInfo<void> {
  const SelectTeamRoute()
      : super(
          SelectTeamRoute.name,
          path: 'select_team_page',
        );

  static const String name = 'SelectTeamRoute';
}

/// generated route for
/// [_i8.CompletionPage]
class CompletionRoute extends _i13.PageRouteInfo<CompletionRouteArgs> {
  CompletionRoute({
    _i14.Key? key,
    required List<_i15.Player> team,
    required List<_i15.Player> side,
  }) : super(
          CompletionRoute.name,
          path: 'completion_page',
          args: CompletionRouteArgs(
            key: key,
            team: team,
            side: side,
          ),
        );

  static const String name = 'CompletionRoute';
}

class CompletionRouteArgs {
  const CompletionRouteArgs({
    this.key,
    required this.team,
    required this.side,
  });

  final _i14.Key? key;

  final List<_i15.Player> team;

  final List<_i15.Player> side;

  @override
  String toString() {
    return 'CompletionRouteArgs{key: $key, team: $team, side: $side}';
  }
}

/// generated route for
/// [_i1.EmptyRouterScreen]
class TopBarContainerRouter extends _i13.PageRouteInfo<void> {
  const TopBarContainerRouter({List<_i13.PageRouteInfo>? children})
      : super(
          TopBarContainerRouter.name,
          path: 'container',
          initialChildren: children,
        );

  static const String name = 'TopBarContainerRouter';
}

/// generated route for
/// [_i9.CreateTeamPage]
class CreateTeamRoute extends _i13.PageRouteInfo<void> {
  const CreateTeamRoute()
      : super(
          CreateTeamRoute.name,
          path: 'create_team_page',
        );

  static const String name = 'CreateTeamRoute';
}

/// generated route for
/// [_i10.RankPage]
class RankRoute extends _i13.PageRouteInfo<void> {
  const RankRoute()
      : super(
          RankRoute.name,
          path: 'rank_page',
        );

  static const String name = 'RankRoute';
}

/// generated route for
/// [_i11.ProfilePage]
class ProfileRoute extends _i13.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile_page',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i12.ContainerPage]
class ContainerRoute extends _i13.PageRouteInfo<void> {
  const ContainerRoute()
      : super(
          ContainerRoute.name,
          path: '',
        );

  static const String name = 'ContainerRoute';
}
