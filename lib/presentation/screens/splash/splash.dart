import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:home_haven/presentation/screens/login/login_page.dart';
import'package:home_haven/presentation/screens/onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Move to the next screen after 3 seconds
    Timer(const Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        // MaterialPageRoute(builder: (context) => LoginPage()), // Change to your Login/Onboarding page
        MaterialPageRoute(builder: (context) => OnboardingScreen()), 
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ Color(0xFF1A7F65), 
                    Color(0xFF115543),
         ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/home.png', 
                width: 150,
                height: 150,
              ),
             
              Text(
                'HomeHaven',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 36,               
                  fontWeight: FontWeight.w800, 
                  height: 1.2,                // line-height: 120%
                  letterSpacing: 0,           // letter-spacing: 0%
                ),
              ),
            ],
          ),
        ),
      )
    );
   
  }
}