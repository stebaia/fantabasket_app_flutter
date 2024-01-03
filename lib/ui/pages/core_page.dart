import 'package:auto_route/auto_route.dart';
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
      routes: [],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: ThemeHelper.enabledPrimaryColor,
            unselectedItemColor: ThemeHelper.backgroundColorDark,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.house), label: 'My Team'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.search), label: 'Ranking'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person), label: 'Profile'),
            ]);
      },
    );
  }
}
