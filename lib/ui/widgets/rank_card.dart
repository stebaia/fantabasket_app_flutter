import 'package:flutter/material.dart';

class RankingCard extends StatelessWidget {
  final MapEntry<String, int> entry;
  const RankingCard({
    required this.entry,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {},
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          color: Color.fromARGB(255, 14, 13, 13),
          surfaceTintColor: Colors.orange,
          elevation: 2,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                Container(
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
                            color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Viale Roma 251",
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Nunito Sans',
                            color: Colors.white),
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
        ),
      ),
    );
  }
}
