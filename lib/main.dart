import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:home_haven/presentation/screens/home/home.dart';
import 'package:home_haven/presentation/screens/login/login_page.dart';
import 'package:home_haven/presentation/screens/main_screen/main_wrapper.dart'; 
import 'package:home_haven/presentation/screens/splash/splash.dart';
import 'presentation/screens/register/register.dart';


void main() {
  // 1. Initialize Flutter and preserve the native splash
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Remove the native splash as soon as MyApp is built
    FlutterNativeSplash.remove();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Haven',
        theme: ThemeData(
          fontFamily: 'Manrope',
          scaffoldBackgroundColor: const Color(0xFFF6F5F5),
        ),
    initialRoute: '/',
    routes: {
      '/': (context) => const SplashScreen(),
       '/main': (context) => const MainWrapper(),
      '/login': (context) => const LoginPage(),
      '/register': (context) => const RegisterPage(),
 
    },
  

    );
  }
}