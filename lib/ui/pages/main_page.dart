import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:fantabasket_app_flutter/utils/theme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthenticatedState) {
            _replacePage(context, const CoreRoute());
          } else {
            _replacePage(context, const LoginRoute());
          }
        },
        child: Container(
          color: Theme.of(context).colorScheme.secondary,
          child: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      color: Theme.of(context).colorScheme.secondary,
                      height: double.infinity,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.white,
                      height: double.infinity,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      color: Theme.of(context).colorScheme.tertiary,
                      height: double.infinity,
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(40.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/basketballicon.png',
                    height: 150,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _replacePage(
      BuildContext context, PageRouteInfo routeInfo) async {
    //context.router.popUntilRoot();
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      await context.router.push(routeInfo);
    }
  }
}
