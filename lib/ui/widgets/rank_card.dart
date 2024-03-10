import 'package:flutter/material.dart';

class RankingCard extends StatelessWidget {
  final MapEntry<String, int> entry;
  const RankingCard({
    required this.entry,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.95,
      height: height * 0.15,
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {},
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
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
                const Expanded(flex: 10, child: SizedBox()),
                Expanded(
                  flex: 70,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          entry.key ?? "Nome campo non disponibile",
                          maxLines: 2,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Nunito Sans',
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Viale Roma 251",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Nunito Sans',
                          ),
                        ),
                      ],
                    ),
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
                    child: Text("${entry.value}"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
