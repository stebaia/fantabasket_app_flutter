import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:fantabasket_app_flutter/utils/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      routes: [RankRoute(), CreatTeamRoute(), ProfileRoute()],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromARGB(255, 212, 131, 9),
            selectedItemColor: Colors.white,
            unselectedItemColor: ThemeHelper.backgroundColorDark,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/ranking.png",
                  height: 20,
                  width: 20,
                ),
                activeIcon: Image.asset(
                  "assets/images/ranking.png",
                  height: 20,
                  width: 20,
                  color: Colors.white,
                ),
                label: 'Ranking',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/basketball.png',
                  height: 20,
                  width: 20,
                ),
                activeIcon: Image.asset(
                  'assets/images/basketball.png',
                  height: 20,
                  width: 20,
                  color: Colors.white,
                ),
                label: 'My Team',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/user.png",
                  height: 20,
                  width: 20,
                ),
                activeIcon: Image.asset(
                  "assets/images/user.png",
                  height: 20,
                  width: 20,
                  color: Colors.white,
                ),
                label: 'Profile',
              ),
            ]);
      },
    );
  }
}
