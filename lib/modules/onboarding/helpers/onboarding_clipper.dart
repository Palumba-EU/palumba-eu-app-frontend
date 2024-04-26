import 'package:flutter/material.dart';

class OnboardingClipper extends CustomClipper<Path> {
  final Radius radius;
  double height;

  OnboardingClipper({required this.radius, required this.height});

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, height - radius.y);
    path.quadraticBezierTo(0.0, height, radius.x, height);
    path.lineTo(size.width - radius.x, height);
    path.quadraticBezierTo(size.width, height, size.width, height - radius.y);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
