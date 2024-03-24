import 'package:auto_route/auto_route.dart';
import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:fantabasket_app_flutter/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class LoadStageCard extends StatelessWidget {
  final Stage stage;

  const LoadStageCard({
    required this.stage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => context.router.push(SelectTeamRoute(stage: stage)),
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          color: Color.fromARGB(255, 14, 13, 13),
          elevation: 2,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stage.fieldName ?? "Nome campo non disponibile",
                          maxLines: 2,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          stage.address ?? "Indirizzo non disponibile",
                          maxLines: 2,
                          style: const TextStyle(
                            color: Colors.white,
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
                              color: Colors.white,
                            )),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
