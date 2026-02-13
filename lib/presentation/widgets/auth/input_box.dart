import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController? controller;
  final bool isPassword;
  final bool obscureText; // Added parameter
  final VoidCallback? onToggle;

  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.controller,
    this.obscureText = false, // Default value
    this.onToggle,
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
                  obscureText: isPassword ? obscureText : false,//<------
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: hint,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 4),
                    border: InputBorder.none,
                    hintStyle: const TextStyle(
                      color: Color(0xFF404040),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isPassword)
            GestureDetector(
              onTap: onToggle, // Call the Cubit function here
              child: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
                color: const Color(0xFF757575),
                size: 25,
              ),
            ),
        ],
      ),
    );
  }
}
