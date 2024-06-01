import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:fantabasket_app_flutter/utils/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CorePage extends StatefulWidget {
  const CorePage({super.key});

  @override
  State<CorePage> createState() => _CorePageState();
}

class _CorePageState extends State<CorePage> {
  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);
    //final switchDasboard = Provider.of<SwitchDashboardProvider>(context);
    return PopScope(
      canPop: false,
      child: AutoTabsScaffold(
        backgroundColor: Colors.white,
        //darkMode.darkTheme ? ThemeHelper.backgroundColorDark : Colors.white,
        routes: [
          const CreateTeamRoute(),
          const RankRoute(),
          const PlayersRoute(),
          ProfileRoute()
        ],
        bottomNavigationBuilder: (context, tabsRouter) {
          return BottomNavigationBar(
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Theme.of(context).colorScheme.primary,
              selectedItemColor: Theme.of(context).colorScheme.tertiary,
              unselectedItemColor:
                  darkMode.darkTheme ? Colors.white : Colors.black,
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Image(
                    width:28,
                    height: 28,
                    image: const AssetImage('assets/images/basketballicon.png'),
                    color: darkMode.darkTheme ? Colors.white : Colors.black,
                  ),
                  activeIcon: Image(
                    width: 28,
                    height: 28,
                    image: const AssetImage('assets/images/basketballicon.png'),
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  label: 'My Team',
                ),
                const BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.rankingStar),
                  activeIcon: FaIcon(FontAwesomeIcons.rankingStar),
                  label: 'Fanta Teams',
                ),
                const BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.users),
                  activeIcon: FaIcon(FontAwesomeIcons.users),
                  label: 'Players',
                ),
                const BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.user),
                  activeIcon: FaIcon(FontAwesomeIcons.user),
                  label: 'Profile',
                ),
              ]);
        },
      ),
    );
  }
}
