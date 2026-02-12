import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class DividerSection extends StatelessWidget {
  const DividerSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 1, color: Color(0xFFC2C2C2))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text("OR", style: GoogleFonts.manrope(color: const Color(0xFF404040))),
        ),
        const Expanded(child: Divider(thickness: 1, color: Color(0xFFC2C2C2))),
      ],
    );
  }
}