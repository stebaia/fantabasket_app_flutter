import 'package:carousel_slider/carousel_slider.dart';
import 'package:fantabasket_app_flutter/bloc/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = (context.read<AuthCubit>().state as AuthenticatedState).user;

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
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 225, 135, 57),
                      borderRadius: BorderRadius.only(
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
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 20),
              child: const Text(
                'Le tue squadre',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 20,
            child: CarouselSlider(
              options: CarouselOptions(
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                aspectRatio: 1,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 2,
                        child: Text(
                          'text $i',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          const Expanded(flex: 1, child: SizedBox()),
          const Expanded(flex: 1, child: Divider(height: 1)),
          const Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 2,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 225, 135, 57),
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
