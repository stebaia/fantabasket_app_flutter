import 'package:fantabasket_app_flutter/model/stage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LoadStageCard extends StatelessWidget {
  final Stage stage;

  const LoadStageCard({
    required this.stage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.95,
      height: height * 0.25,
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.centerLeft,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 15,
                child: Text(
                  "${stage.city}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const Expanded(
                flex: 5,
                child: SizedBox(),
              ),
              Expanded(
                flex: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 20,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.asset(
                          'assets/images/campo.png',
                        ),
                      ),
                    ),
                    const Expanded(flex: 7, child: SizedBox()),
                    Expanded(
                      flex: 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              stage.fieldName ?? "Nome campo non disponibile",
                              maxLines: 2,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              stage.address ?? "Indirizzo non disponibile",
                              maxLines: 2,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Da ${DateFormat('dd/MM/yyyy').format(stage.openingDate!)} "
                              "a ${DateFormat('dd/MM/yyyy').format(stage.closingDate!)}",
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
