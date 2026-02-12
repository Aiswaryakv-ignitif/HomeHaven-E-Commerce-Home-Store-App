import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/auth/header.dart';
import '../../widgets/auth/input_box.dart';
import '../../widgets/auth/button.dart';
import '../../widgets/auth/divider.dart';
import '../../widgets/auth/social_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsetsGeometry.fromSTEB(16, 0, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              const AuthHeader(
                title: "Create Account",
                subtitle:
                    "Fill in your details below to get started on a seamless shopping experience.",
              ),

              const SizedBox(height: 32),

              // --- REGISTRATION FIELDS ---
              const AuthTextField(
                label: "Full Name",
                hint: "Claire",
                icon: Icons.person_outline,
              ),

              const SizedBox(height: 12),

              const AuthTextField(
                label: "Last Name",
                hint: "Cooper",
                icon: Icons.person_outline,
              ),

              const SizedBox(height: 12),

              const AuthTextField(
                label: "Email ",
                hint: "claire.cooper@gmail.com",
                icon: Icons.email_outlined,
              ),

              const SizedBox(height: 12),

              const AuthTextField(
                label: "Password",
                hint: "**********",
                icon: Icons.lock_outline,
                isPassword: true,
              ),

              const SizedBox(height: 24),

              // --- TERMS & PRIVACY TEXT ---
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    color: const Color(0xFF757575),
                    height: 1.4,
                  ),
                  children: [
                    const TextSpan(
                      text:
                          "By clicking Create Account, you acknowledge you have read and agreed to our ",
                    ),
                    TextSpan(
                      text: "Terms of Use",
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.bold,
                        color: const Color(
                          0xFF156651,
                        ), 
                      ),
                    ),
                    const TextSpan(text: " and "),
                    TextSpan(
                      text: "Privacy Policy",
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.bold,
                        color: const Color(
                          0xFF156651,
                        ), 
                      ),
                    ),
                  ],
                ),
              ),

            
              const SizedBox(height: 24),

              AuthButton(
                text: "Create Account",
                onPressed: () {
                  // Add registration logic here
                },
              ),

              const SizedBox(height: 24),

              const DividerSection(), 

              const SizedBox(height: 24),

              const SocialButton(
                label: "Continue with Google",
                iconPath: "assets/google_icon.png",
              ),

              const SizedBox(height: 12),

              const SocialButton(
                label: "Continue with Facebook",
                iconPath: "assets/facebook_icon.png",
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
