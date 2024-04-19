import 'package:flutter/material.dart';

class LoginWaveClipper extends CustomClipper<Path> {
  final height;
  final width;

  const LoginWaveClipper({
    required this.height,
    required this.width,
  });

  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, height * 0.8);

    // Crea la forma ondulata
    path.quadraticBezierTo(
      0,
      height * 0.8,
      width * 0.25,
      height * 0.8,
    );

    //path.lineTo(width * 0.9, height * 0.7);

    // Crea la forma ondulata
    path.quadraticBezierTo(
      width,
      height * 0.8,
      width,
      height * 0.6,
    );

    // Linea verticale fino in fondo
    path.lineTo(width, height);

    // Linea orizzontale in fondo
    path.lineTo(0, height);

    // Chiudi il percorso
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
