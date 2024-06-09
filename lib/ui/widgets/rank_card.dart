import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RankingCard extends StatelessWidget {
  final Stage stage;

  const RankingCard({
    required this.stage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);

    return GestureDetector(
      onTap: () => context.router.push(
          RankDetailRoute(stage: stage, status: stage.status == 'Aperta')),
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
                child: stage.photo != ''
                    ? Image.network(
                        stage.photo!,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/LeBron_James_%2851959977144%29_%28cropped2%29.jpg/640px-LeBron_James_%2851959977144%29_%28cropped2%29.jpg',
                        fit: BoxFit.cover),
              ),
            ),
            const Expanded(flex: 4, child: SizedBox()),
            Expanded(
              flex: 50,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      stage.fieldName ?? "Nome campo non disponibile",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Nunito Sans',
                        fontSize: 16,
                        color: darkMode.darkTheme ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      stage.city ?? "Città non disponibile",
                      maxLines: 2,
                      style: TextStyle(
                        fontFamily: 'Nunito Sans',
                        color: darkMode.darkTheme ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(flex: 3, child: SizedBox()),
            Expanded(
              flex: 10,
              child: stage.position == 0
                  ? Container()
                  : Container(
                      decoration: BoxDecoration(
                        color: switch (stage.position) {
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
                      child: Text("${stage.position}°"),
                    ),
            ),
            const Expanded(flex: 2, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
