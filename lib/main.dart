import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:home_haven/presentation/cubit/cart/cart_cubit.dart';
import 'package:home_haven/presentation/cubit/favorites/favorites_cubit.dart';
import 'package:home_haven/presentation/cubit/onboard/onboarding_cubit.dart';
// import 'package:home_haven/presentation/screens/home/home.dart';
import 'package:home_haven/presentation/screens/login/login_page.dart';
import 'package:home_haven/presentation/screens/main_screen/main_wrapper.dart';
import 'package:home_haven/presentation/screens/onboarding/onboarding.dart';
import 'package:home_haven/presentation/screens/splash/splash.dart';
import 'presentation/screens/register/register.dart';

void main() {
  // 1. Initialize Flutter and preserve the native splash
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CartCubit>(
          create: (context) => CartCubit(),
        ),
       
        BlocProvider<OnboardingCubit>(
          create: (context) => OnboardingCubit(),
        ),


        BlocProvider(create: (context) => FavoritesCubit()..loadFavorites()),
      ],
       child: const MyApp()),
  );
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
        scaffoldBackgroundColor: const Color.fromARGB(255, 228, 225, 225),
      ),
      initialRoute: '/',

      routes: {
        '/': (context) => const SplashScreen(),
         '/main': (context) => const MainWrapper(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
         '/onboard': (context) => const OnboardingScreen(),
      },

      
    );
  }
}
