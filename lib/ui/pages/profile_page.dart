import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:fantabasket_app_flutter/bloc/view_team_bloc/view_team_bloc.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/ui/widgets/team_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = (context.read<AuthCubit>().state as AuthenticatedState).user;
    final darkMode = Provider.of<DarkThemeProvider>(context);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
          child: Column(
        children: [
          Expanded(
            flex: 9,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      )),
                  child: Column(
                    children: [
                      const Expanded(flex: 3, child: SizedBox()),
                      Expanded(
                        flex: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50.0)),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.0,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset(
                              'assets/images/player.jpeg',
                            ),
                          ),
                        ),
                      ),
                      const Expanded(flex: 1, child: SizedBox()),
                      Expanded(
                        flex: 3,
                        child: Text(
                          '${user.firstName} ${user.lastName}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Expanded(flex: 2, child: SizedBox()),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          const Expanded(flex: 2, child: SizedBox()),
          const Expanded(flex: 1, child: SizedBox()),
          const Expanded(flex: 1, child: Divider(height: 1)),
          Expanded(
            flex: 2,
            child: Container(
              height: 50,
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.moon,
                          color: darkMode.darkTheme
                              ? CupertinoColors.white
                              : CupertinoColors.black),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Dark Mode',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: darkMode.darkTheme
                                ? CupertinoColors.white
                                : CupertinoColors.black),
                      ),
                      Spacer(),
                      CupertinoSwitch(
                        value: darkMode.darkTheme,
                        onChanged: (value) {
                          darkMode.darkTheme = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 2,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.background,
                ),
                onPressed: () => context.read<AuthCubit>().manualLogout(),
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          ),
          const Expanded(flex: 1, child: SizedBox()),
        ],
      )),
    );
  }
}
