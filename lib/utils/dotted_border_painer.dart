import 'dart:math';

import 'package:fantabasket_app_flutter/utils/theme_helper.dart';
import 'package:flutter/material.dart';

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ThemeHelper.textSecondaryColor // Colore del bordo puntinato
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // Larghezza del bordo

    // Calcola il numero di segmenti puntinati in base al perimetro del cerchio
    final double radius = size.width / 2;
    final double circumference = 2 * radius * 3.14159265359; // Circonferenza
    final double dashWidth = 5; // Larghezza di ciascun segmento puntinato
    final double dashSpace = 5; // Spazio tra i segmenti puntinati
    final int numDashes = (circumference / (dashWidth + dashSpace)).floor();

    final deltaAngle = 360 / numDashes;

    for (int i = 0; i < numDashes; i++) {
      final double startAngle = deltaAngle * i;
      final double endAngle = startAngle + deltaAngle / 2;

      final double startX = radius * cos(startAngle * pi / 180);
      final double startY = radius * sin(startAngle * pi / 180);

      final double endX = radius * cos(endAngle * pi / 180);
      final double endY = radius * sin(endAngle * pi / 180);

      final Offset start = Offset(radius + startX, radius + startY);
      final Offset end = Offset(radius + endX, radius + endY);

      canvas.drawLine(start, end, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
