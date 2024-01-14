import 'package:fantabasket_app_flutter/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:fantabasket_app_flutter/ui/widgets/wave_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTeamPage extends StatelessWidget {
  const CreateTeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 225, 135, 57),
      child: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              color: Colors.white,
              height: double.infinity,
            ),
          ),
          Positioned(
            right: 30,
            top: 30,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 3,
                foregroundColor: Colors.black,
              ),
              onPressed: () {},
              child: const Text(
                "Crea squadra",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
