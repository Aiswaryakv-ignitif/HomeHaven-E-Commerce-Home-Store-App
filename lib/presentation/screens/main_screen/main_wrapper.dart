import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_haven/presentation/cubit/bottom_navigation/bottom_nav_cubit.dart';
import 'package:home_haven/presentation/cubit/bottom_navigation/bottom_nav_state.dart';
import 'package:home_haven/presentation/screens/cart/mycart.dart';
import 'package:home_haven/presentation/screens/home/home.dart';
import 'package:home_haven/presentation/screens/profile/myprofile.dart';
import 'package:home_haven/presentation/widgets/bottom_navbar/custom_bottom_nav.dart';
class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomePage(),   
      const MyCart(),     
      const MyProfile(),  
    ];

    return BlocProvider(
      create: (context) => NavbarCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F5F5),
        body: BlocBuilder<NavbarCubit, NavbarState>(
          builder: (context, state) {
            return IndexedStack(
              index: state.selectedIndex,
              children: pages,
            );
          },
        ),
        bottomNavigationBar: const CustomBottomNav(),
      ),
    );
  }
}