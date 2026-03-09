import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkAppState();
  }

  Future<void> checkAppState() async {
    final prefs = await SharedPreferences.getInstance();

    bool isOnboardingSeen = prefs.getBool('isOnboardingSeen') ?? false;

    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    if (!isOnboardingSeen) {
      Navigator.pushReplacementNamed(context, '/onboard');
    } else if (!isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      Navigator.pushReplacementNamed(context, '/main');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A7F65), Color(0xFF115543)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/home.png', width: 150, height: 150),

              Text(
                'HomeHaven',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  height: 1.2, // line-height: 120%
                  letterSpacing: 0, // letter-spacing: 0%
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
