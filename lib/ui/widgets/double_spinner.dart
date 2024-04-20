import 'package:flutter/material.dart';

class DoubleSpinner extends StatelessWidget {
  const DoubleSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: height * 0.15,
            height: height * 0.15,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.secondary),
              strokeWidth: 5.0,
            ),
          ),
          Transform.rotate(
            angle: -3.14,
            child: SizedBox(
              width: height * 0.12,
              height: height * 0.12,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.tertiary),
                strokeWidth:
                    5.0, // Imposta lo spessore e il diametro del CircularProgressIndicator esterno
              ),
            ),
          ),
          Image.asset(
            'assets/images/basketballicon_colored.png',
            width: height * 0.1,
          ),
        ],
      ),
    );
  }
}
