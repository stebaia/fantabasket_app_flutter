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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:auto_route/empty_router_widgets.dart' as _i1;
import 'package:flutter/material.dart' as _i11;

import '../ui/pages/container_page.dart' as _i9;
import '../ui/pages/core_page.dart' as _i5;
import '../ui/pages/create_team.dart' as _i6;
import '../ui/pages/login_page.dart' as _i3;
import '../ui/pages/main_page.dart' as _i2;
import '../ui/pages/profile_page.dart' as _i8;
import '../ui/pages/rank_page.dart' as _i7;
import '../ui/pages/registration_page.dart' as _i4;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    EmptyRouterRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.MainPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.WrappedRoute(child: const _i3.LoginPage()),
      );
    },
    RegistrationRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.WrappedRoute(child: const _i4.RegistrationPage()),
      );
    },
    CoreRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.CorePage(),
      );
    },
    TopBarContainerRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterScreen(),
      );
    },
    CreatTeamRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.CreateTeamPage(),
      );
    },
    RankRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.RankPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ProfilePage(),
      );
    },
    ContainerRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ContainerPage(),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          EmptyRouterRoute.name,
          path: '/',
          children: [
            _i10.RouteConfig(
              MainRoute.name,
              path: '',
              parent: EmptyRouterRoute.name,
            ),
            _i10.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: EmptyRouterRoute.name,
            ),
            _i10.RouteConfig(
              RegistrationRoute.name,
              path: 'registration',
              parent: EmptyRouterRoute.name,
            ),
            _i10.RouteConfig(
              CoreRoute.name,
              path: 'core',
              parent: EmptyRouterRoute.name,
              children: [
                _i10.RouteConfig(
                  TopBarContainerRouter.name,
                  path: 'container',
                  parent: CoreRoute.name,
                  children: [
                    _i10.RouteConfig(
                      ContainerRoute.name,
                      path: '',
                      parent: TopBarContainerRouter.name,
                    )
                  ],
                ),
                _i10.RouteConfig(
                  CreatTeamRoute.name,
                  path: 'create_team_page',
                  parent: CoreRoute.name,
                ),
                _i10.RouteConfig(
                  RankRoute.name,
                  path: 'rank_page',
                  parent: CoreRoute.name,
                ),
                _i10.RouteConfig(
                  ProfileRoute.name,
                  path: 'profile_page',
                  parent: CoreRoute.name,
                ),
              ],
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class EmptyRouterRoute extends _i10.PageRouteInfo<void> {
  const EmptyRouterRoute({List<_i10.PageRouteInfo>? children})
      : super(
          EmptyRouterRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'EmptyRouterRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i10.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.RegistrationPage]
class RegistrationRoute extends _i10.PageRouteInfo<void> {
  const RegistrationRoute()
      : super(
          RegistrationRoute.name,
          path: 'registration',
        );

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i5.CorePage]
class CoreRoute extends _i10.PageRouteInfo<void> {
  const CoreRoute({List<_i10.PageRouteInfo>? children})
      : super(
          CoreRoute.name,
          path: 'core',
          initialChildren: children,
        );

  static const String name = 'CoreRoute';
}

/// generated route for
/// [_i1.EmptyRouterScreen]
class TopBarContainerRouter extends _i10.PageRouteInfo<void> {
  const TopBarContainerRouter({List<_i10.PageRouteInfo>? children})
      : super(
          TopBarContainerRouter.name,
          path: 'container',
          initialChildren: children,
        );

  static const String name = 'TopBarContainerRouter';
}

/// generated route for
/// [_i6.CreateTeamPage]
class CreatTeamRoute extends _i10.PageRouteInfo<void> {
  const CreatTeamRoute()
      : super(
          CreatTeamRoute.name,
          path: 'create_team_page',
        );

  static const String name = 'CreatTeamRoute';
}

/// generated route for
/// [_i7.RankPage]
class RankRoute extends _i10.PageRouteInfo<void> {
  const RankRoute()
      : super(
          RankRoute.name,
          path: 'rank_page',
        );

  static const String name = 'RankRoute';
}

/// generated route for
/// [_i8.ProfilePage]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile_page',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i9.ContainerPage]
class ContainerRoute extends _i10.PageRouteInfo<void> {
  const ContainerRoute()
      : super(
          ContainerRoute.name,
          path: '',
        );

  static const String name = 'ContainerRoute';
}
