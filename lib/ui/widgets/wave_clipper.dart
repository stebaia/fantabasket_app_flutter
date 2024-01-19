import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height * 0.35);

    // Crea la forma ondulata
    path.quadraticBezierTo(
      0,
      size.height * 0.5,
      size.width * 0.25,
      size.height * 0.5,
    );

    path.lineTo(size.width * 0.75, size.height * 0.5);

    // Crea la forma ondulata
    path.quadraticBezierTo(
      size.width,
      size.height * 0.5,
      size.width,
      size.height * 0.65,
    );

    // Linea verticale fino in fondo
    path.lineTo(size.width, size.height);

    // Linea orizzontale in fondo
    path.lineTo(0, size.height);

    // Chiudi il percorso
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
