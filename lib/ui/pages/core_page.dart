import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:fantabasket_app_flutter/utils/theme_helper.dart';
import 'package:flutter/cupertino.dart';
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
    //final darkMode = Provider.of<DarkThemeProvider>(context);
    //final switchDasboard = Provider.of<SwitchDashboardProvider>(context);
    return AutoTabsScaffold(
      backgroundColor: Colors.white,
      //darkMode.darkTheme ? ThemeHelper.backgroundColorDark : Colors.white,
      routes: [RankRoute(), CreateTeamRoute(), ProfileRoute()],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: ThemeHelper.backgroundColorDark,
            selectedItemColor: const Color.fromARGB(255, 225, 135, 57),
            unselectedItemColor: Colors.white,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.rankingStar),
                activeIcon: FaIcon(FontAwesomeIcons.rankingStar),
                label: 'Ranking',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.basketball),
                activeIcon: FaIcon(FontAwesomeIcons.basketball),
                label: 'My Team',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.user),
                activeIcon: FaIcon(FontAwesomeIcons.user),
                label: 'Profile',
              ),
            ]);
      },
    );
  }
}
