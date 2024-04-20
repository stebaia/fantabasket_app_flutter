import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RankingCard extends StatelessWidget {
  final MapEntry<String, int> entry;
  const RankingCard({
    required this.entry,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);

    return GestureDetector(
      onTap: () => context.router.push(RankDetailRoute(stageName: entry.key)),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        color: Theme.of(context).colorScheme.primary,
        elevation: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/campo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    entry.key ?? "Nome campo non disponibile",
                    maxLines: 2,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito Sans',
                        fontSize: 18,
                        color:
                            darkMode.darkTheme ? Colors.white : Colors.black),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Viale Roma 251",
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Nunito Sans',
                        color:
                            darkMode.darkTheme ? Colors.white : Colors.black),
                  ),
                ],
              ),
            ),
            const Expanded(flex: 10, child: SizedBox()),
            Expanded(
              flex: 15,
              child: Container(
                decoration: BoxDecoration(
                  color: switch (entry.value) {
                    1 => const Color.fromARGB(255, 255, 215, 0),
                    2 => const Color.fromARGB(255, 192, 192, 192),
                    3 => const Color.fromARGB(255, 176, 141, 87),
                    _ => Colors.white,
                  },
                  border: Border.all(
                      color: const Color.fromARGB(255, 212, 204, 204)),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text("${entry.value}°"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
