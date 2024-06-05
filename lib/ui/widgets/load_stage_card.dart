import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/di/dependency_injector.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class LoadStageCard extends StatelessWidget {
  final Stage stage;

  const LoadStageCard({
    required this.stage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = Provider.of<DarkThemeProvider>(context);
    return GestureDetector(
      onTap: () => {
        if (stage.status == "Chiusa")
          {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Keep Calm! La tappa ancora non è aperta!'),
              backgroundColor: Colors.red,
            ))
          }
        else
          {context.router.push(SelectTeamRoute(stageId: stage.id))}
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        color: Theme.of(context).colorScheme.primary,
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stage.fieldName ?? "Nome campo non disponibile",
                      maxLines: 2,
                      style: TextStyle(
                          color:
                              darkMode.darkTheme ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      stage.city ?? "Indirizzo non disponibile",
                      maxLines: 2,
                      style: TextStyle(
                        color: darkMode.darkTheme ? Colors.white : Colors.black,
                      ),
                    ),
                    Text(
                        "Da ${stage.openingDate} "
                        "a ${stage.closingDate}",
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              darkMode.darkTheme ? Colors.white : Colors.black,
                        )),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
