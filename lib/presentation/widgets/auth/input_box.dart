import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController? controller;
  final bool isPassword;

  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    this.isPassword = false,
     this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFDEDCDC), width: 1.5),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF757575), size: 25),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    color: const Color(0xFF404040),
                   
                  ),
                ),
                TextField(
                  obscureText: isPassword,
                   controller: controller,
                  decoration: InputDecoration(
                    hintText: hint,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 4),
                    border: InputBorder.none,
                    hintStyle: const TextStyle(color: Color(0xFF404040), fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          if (isPassword) const Icon(Icons.visibility, color: Color(0xFF757575), size:25),
        ],
      ),
    );
  }
}