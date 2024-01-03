import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:fantabasket_app_flutter/utils/theme_helper.dart';
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
    return BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthenticatedState) {
            _replacePage(context, const CoreRoute());
          } else {
            _replacePage(context, LoginRoute());
          }
        },
        child: const Center(
          child:
              CircularProgressIndicator(color: ThemeHelper.enabledPrimaryColor),
        ));
  }

  Future<void> _replacePage(
      BuildContext context, PageRouteInfo routeInfo) async {
    //context.router.popUntilRoot();
    await context.router.push(routeInfo);
  }
}
