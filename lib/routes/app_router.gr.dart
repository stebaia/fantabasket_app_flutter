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
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:auto_route/empty_router_widgets.dart' as _i1;
import 'package:flutter/material.dart' as _i19;

import '../model/player.dart' as _i21;
import '../model/stage.dart' as _i22;
import '../model/team.dart' as _i20;
import '../ui/pages/best_players_page.dart' as _i12;
import '../ui/pages/completion_page.dart' as _i8;
import '../ui/pages/container_page.dart' as _i17;
import '../ui/pages/core_page.dart' as _i5;
import '../ui/pages/create_team.dart' as _i13;
import '../ui/pages/load_stages_page.dart' as _i6;
import '../ui/pages/login_page.dart' as _i3;
import '../ui/pages/main_page.dart' as _i2;
import '../ui/pages/player_detail_page.dart' as _i11;
import '../ui/pages/players_page.dart' as _i15;
import '../ui/pages/profile_page.dart' as _i16;
import '../ui/pages/rank_detail_page.dart' as _i9;
import '../ui/pages/rank_page.dart' as _i14;
import '../ui/pages/registration_page.dart' as _i4;
import '../ui/pages/select_team_page.dart' as _i7;
import '../ui/pages/team_detail_page.dart' as _i10;

class AppRouter extends _i18.RootStackRouter {
  AppRouter([_i19.GlobalKey<_i19.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    EmptyRouterRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.MainPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(child: const _i3.LoginPage()),
      );
    },
    RegistrationRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(child: const _i4.RegistrationPage()),
      );
    },
    CoreRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.CorePage(),
      );
    },
    LoadStagesRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(child: const _i6.LoadStagesPage()),
      );
    },
    SelectTeamRoute.name: (routeData) {
      final args = routeData.argsAs<SelectTeamRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(
            child: _i7.SelectTeamPage(
          stageId: args.stageId,
          team: args.team,
          key: args.key,
        )),
      );
    },
    CompletionRoute.name: (routeData) {
      final args = routeData.argsAs<CompletionRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(
            child: _i8.CompletionPage(
          key: args.key,
          team: args.team,
          side: args.side,
          stageId: args.stageId,
        )),
      );
    },
    RankDetailRoute.name: (routeData) {
      final args = routeData.argsAs<RankDetailRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(
            child: _i9.RankDetailPage(
          stage: args.stage,
          key: args.key,
        )),
      );
    },
    TeamDetailRoute.name: (routeData) {
      final args = routeData.argsAs<TeamDetailRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(
            child: _i10.TeamDetailPage(
          teamId: args.teamId,
          teamName: args.teamName,
          key: args.key,
        )),
      );
    },
    PlayerDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PlayerDetailRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(
            child: _i11.PlayerDetailPage(
          id: args.id,
          firstName: args.firstName,
          lastName: args.lastName,
          key: args.key,
        )),
      );
    },
    BestPlayersRoute.name: (routeData) {
      final args = routeData.argsAs<BestPlayersRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(
            child: _i12.BestPlayersPage(
          stage: args.stage,
          key: args.key,
        )),
      );
    },
    TopBarContainerRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterScreen(),
      );
    },
    CreateTeamRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(child: const _i13.CreateTeamPage()),
      );
    },
    RankRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(child: const _i14.RankPage()),
      );
    },
    PlayersRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.WrappedRoute(child: const _i15.PlayersPage()),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.ProfilePage(),
      );
    },
    ContainerRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.ContainerPage(),
      );
    },
  };

  @override
  List<_i18.RouteConfig> get routes => [
        _i18.RouteConfig(
          EmptyRouterRoute.name,
          path: '/',
          children: [
            _i18.RouteConfig(
              MainRoute.name,
              path: '',
              parent: EmptyRouterRoute.name,
            ),
            _i18.RouteConfig(
              LoginRoute.name,
              path: 'login',
              parent: EmptyRouterRoute.name,
            ),
            _i18.RouteConfig(
              RegistrationRoute.name,
              path: 'registration',
              parent: EmptyRouterRoute.name,
            ),
            _i18.RouteConfig(
              CoreRoute.name,
              path: 'core',
              parent: EmptyRouterRoute.name,
              children: [
                _i18.RouteConfig(
                  TopBarContainerRouter.name,
                  path: 'container',
                  parent: CoreRoute.name,
                  children: [
                    _i18.RouteConfig(
                      ContainerRoute.name,
                      path: '',
                      parent: TopBarContainerRouter.name,
                    )
                  ],
                ),
                _i18.RouteConfig(
                  CreateTeamRoute.name,
                  path: 'create_team_page',
                  parent: CoreRoute.name,
                ),
                _i18.RouteConfig(
                  RankRoute.name,
                  path: 'rank_page',
                  parent: CoreRoute.name,
                ),
                _i18.RouteConfig(
                  PlayersRoute.name,
                  path: 'players_page',
                  parent: CoreRoute.name,
                ),
                _i18.RouteConfig(
                  ProfileRoute.name,
                  path: 'profile_page',
                  parent: CoreRoute.name,
                ),
              ],
            ),
            _i18.RouteConfig(
              LoadStagesRoute.name,
              path: 'load_stages_page',
              parent: EmptyRouterRoute.name,
            ),
            _i18.RouteConfig(
              SelectTeamRoute.name,
              path: 'select_team_page',
              parent: EmptyRouterRoute.name,
            ),
            _i18.RouteConfig(
              CompletionRoute.name,
              path: 'completion_page',
              parent: EmptyRouterRoute.name,
            ),
            _i18.RouteConfig(
              RankDetailRoute.name,
              path: 'rank_detail_page',
              parent: EmptyRouterRoute.name,
            ),
            _i18.RouteConfig(
              TeamDetailRoute.name,
              path: 'team_detail_page',
              parent: EmptyRouterRoute.name,
            ),
            _i18.RouteConfig(
              PlayerDetailRoute.name,
              path: 'player_detail_page',
              parent: EmptyRouterRoute.name,
            ),
            _i18.RouteConfig(
              BestPlayersRoute.name,
              path: 'best_players_page',
              parent: EmptyRouterRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class EmptyRouterRoute extends _i18.PageRouteInfo<void> {
  const EmptyRouterRoute({List<_i18.PageRouteInfo>? children})
      : super(
          EmptyRouterRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'EmptyRouterRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i18.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i18.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.RegistrationPage]
class RegistrationRoute extends _i18.PageRouteInfo<void> {
  const RegistrationRoute()
      : super(
          RegistrationRoute.name,
          path: 'registration',
        );

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i5.CorePage]
class CoreRoute extends _i18.PageRouteInfo<void> {
  const CoreRoute({List<_i18.PageRouteInfo>? children})
      : super(
          CoreRoute.name,
          path: 'core',
          initialChildren: children,
        );

  static const String name = 'CoreRoute';
}

/// generated route for
/// [_i6.LoadStagesPage]
class LoadStagesRoute extends _i18.PageRouteInfo<void> {
  const LoadStagesRoute()
      : super(
          LoadStagesRoute.name,
          path: 'load_stages_page',
        );

  static const String name = 'LoadStagesRoute';
}

/// generated route for
/// [_i7.SelectTeamPage]
class SelectTeamRoute extends _i18.PageRouteInfo<SelectTeamRouteArgs> {
  SelectTeamRoute({
    required int stageId,
    _i20.Team? team,
    _i19.Key? key,
  }) : super(
          SelectTeamRoute.name,
          path: 'select_team_page',
          args: SelectTeamRouteArgs(
            stageId: stageId,
            team: team,
            key: key,
          ),
        );

  static const String name = 'SelectTeamRoute';
}

class SelectTeamRouteArgs {
  const SelectTeamRouteArgs({
    required this.stageId,
    this.team,
    this.key,
  });

  final int stageId;

  final _i20.Team? team;

  final _i19.Key? key;

  @override
  String toString() {
    return 'SelectTeamRouteArgs{stageId: $stageId, team: $team, key: $key}';
  }
}

/// generated route for
/// [_i8.CompletionPage]
class CompletionRoute extends _i18.PageRouteInfo<CompletionRouteArgs> {
  CompletionRoute({
    _i19.Key? key,
    required List<_i21.Player> team,
    required List<_i21.Player> side,
    required int stageId,
  }) : super(
          CompletionRoute.name,
          path: 'completion_page',
          args: CompletionRouteArgs(
            key: key,
            team: team,
            side: side,
            stageId: stageId,
          ),
        );

  static const String name = 'CompletionRoute';
}

class CompletionRouteArgs {
  const CompletionRouteArgs({
    this.key,
    required this.team,
    required this.side,
    required this.stageId,
  });

  final _i19.Key? key;

  final List<_i21.Player> team;

  final List<_i21.Player> side;

  final int stageId;

  @override
  String toString() {
    return 'CompletionRouteArgs{key: $key, team: $team, side: $side, stageId: $stageId}';
  }
}

/// generated route for
/// [_i9.RankDetailPage]
class RankDetailRoute extends _i18.PageRouteInfo<RankDetailRouteArgs> {
  RankDetailRoute({
    required _i22.Stage stage,
    _i19.Key? key,
  }) : super(
          RankDetailRoute.name,
          path: 'rank_detail_page',
          args: RankDetailRouteArgs(
            stage: stage,
            key: key,
          ),
        );

  static const String name = 'RankDetailRoute';
}

class RankDetailRouteArgs {
  const RankDetailRouteArgs({
    required this.stage,
    this.key,
  });

  final _i22.Stage stage;

  final _i19.Key? key;

  @override
  String toString() {
    return 'RankDetailRouteArgs{stage: $stage, key: $key}';
  }
}

/// generated route for
/// [_i10.TeamDetailPage]
class TeamDetailRoute extends _i18.PageRouteInfo<TeamDetailRouteArgs> {
  TeamDetailRoute({
    required int teamId,
    required String teamName,
    _i19.Key? key,
  }) : super(
          TeamDetailRoute.name,
          path: 'team_detail_page',
          args: TeamDetailRouteArgs(
            teamId: teamId,
            teamName: teamName,
            key: key,
          ),
        );

  static const String name = 'TeamDetailRoute';
}

class TeamDetailRouteArgs {
  const TeamDetailRouteArgs({
    required this.teamId,
    required this.teamName,
    this.key,
  });

  final int teamId;

  final String teamName;

  final _i19.Key? key;

  @override
  String toString() {
    return 'TeamDetailRouteArgs{teamId: $teamId, teamName: $teamName, key: $key}';
  }
}

/// generated route for
/// [_i11.PlayerDetailPage]
class PlayerDetailRoute extends _i18.PageRouteInfo<PlayerDetailRouteArgs> {
  PlayerDetailRoute({
    required int id,
    required String firstName,
    required String lastName,
    _i19.Key? key,
  }) : super(
          PlayerDetailRoute.name,
          path: 'player_detail_page',
          args: PlayerDetailRouteArgs(
            id: id,
            firstName: firstName,
            lastName: lastName,
            key: key,
          ),
        );

  static const String name = 'PlayerDetailRoute';
}

class PlayerDetailRouteArgs {
  const PlayerDetailRouteArgs({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.key,
  });

  final int id;

  final String firstName;

  final String lastName;

  final _i19.Key? key;

  @override
  String toString() {
    return 'PlayerDetailRouteArgs{id: $id, firstName: $firstName, lastName: $lastName, key: $key}';
  }
}

/// generated route for
/// [_i12.BestPlayersPage]
class BestPlayersRoute extends _i18.PageRouteInfo<BestPlayersRouteArgs> {
  BestPlayersRoute({
    required _i22.Stage stage,
    _i19.Key? key,
  }) : super(
          BestPlayersRoute.name,
          path: 'best_players_page',
          args: BestPlayersRouteArgs(
            stage: stage,
            key: key,
          ),
        );

  static const String name = 'BestPlayersRoute';
}

class BestPlayersRouteArgs {
  const BestPlayersRouteArgs({
    required this.stage,
    this.key,
  });

  final _i22.Stage stage;

  final _i19.Key? key;

  @override
  String toString() {
    return 'BestPlayersRouteArgs{stage: $stage, key: $key}';
  }
}

/// generated route for
/// [_i1.EmptyRouterScreen]
class TopBarContainerRouter extends _i18.PageRouteInfo<void> {
  const TopBarContainerRouter({List<_i18.PageRouteInfo>? children})
      : super(
          TopBarContainerRouter.name,
          path: 'container',
          initialChildren: children,
        );

  static const String name = 'TopBarContainerRouter';
}

/// generated route for
/// [_i13.CreateTeamPage]
class CreateTeamRoute extends _i18.PageRouteInfo<void> {
  const CreateTeamRoute()
      : super(
          CreateTeamRoute.name,
          path: 'create_team_page',
        );

  static const String name = 'CreateTeamRoute';
}

/// generated route for
/// [_i14.RankPage]
class RankRoute extends _i18.PageRouteInfo<void> {
  const RankRoute()
      : super(
          RankRoute.name,
          path: 'rank_page',
        );

  static const String name = 'RankRoute';
}

/// generated route for
/// [_i15.PlayersPage]
class PlayersRoute extends _i18.PageRouteInfo<void> {
  const PlayersRoute()
      : super(
          PlayersRoute.name,
          path: 'players_page',
        );

  static const String name = 'PlayersRoute';
}

/// generated route for
/// [_i16.ProfilePage]
class ProfileRoute extends _i18.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile_page',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i17.ContainerPage]
class ContainerRoute extends _i18.PageRouteInfo<void> {
  const ContainerRoute()
      : super(
          ContainerRoute.name,
          path: '',
        );

  static const String name = 'ContainerRoute';
}
