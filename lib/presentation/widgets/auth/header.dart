import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --- 1. REUSABLE HEADER ---
class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.manrope(
            fontSize: 40, 
            fontWeight: FontWeight.w800,
            color: const Color(0xFF404040),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: GoogleFonts.manrope(
            fontSize: 18,
              height: 1.1,
                  wordSpacing: 0.5,
            color: const Color(0xFF757575),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}