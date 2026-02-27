import 'package:flutter/material.dart';

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // Start top-left, go down the left side
    path.lineTo(0, size.height - 80); 

    // The Magic Curve: Control point is horizontally centered 
    // and vertically 40 pixels BELOW the image height
    path.quadraticBezierTo(
      size.width / 2, size.height + 40, 
      size.width, size.height - 80,
    );

    // Go up to the top-right and close
    path.lineTo(size.width, 0);
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}