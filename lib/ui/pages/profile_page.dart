import 'package:fantabasket_app_flutter/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = (context.read<AuthCubit>().state as AuthenticatedState).user;

    return Container(
      child: Center(
          child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Text('Benvenuto ${user.firstName} ${user.lastName}'),
          TextButton(
              child: Text('Logout'),
              onPressed: () => context.read<AuthCubit>().manualLogout()),
        ],
      )),
    );
  }
}
