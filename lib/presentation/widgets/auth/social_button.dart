import 'package:flutter/material.dart';
// --- 4. REUSABLE SOCIAL BUTTON ---
class SocialButton extends StatelessWidget {
  final String label;
  final String iconPath;

  const SocialButton({super.key, required this.label, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF156651), width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 20, width: 20),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xFF156651)),
          ),
        ],
      ),
    );
  }
}