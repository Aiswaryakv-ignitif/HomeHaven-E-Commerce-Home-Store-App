
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_haven/presentation/cubit/bottom_navigation/bottom_nav_cubit.dart';
import 'package:home_haven/presentation/cubit/bottom_navigation/bottom_nav_state.dart';


class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarCubit, NavbarState>(
      builder: (context, state) {
        return Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0).withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            backgroundColor: const Color(0xFFFFFFFF),
            selectedItemColor: const Color(0xFF156651),
            unselectedItemColor: Colors.grey,
            currentIndex: state.selectedIndex,   //<<<<---------------
            onTap: (index) => context.read<NavbarCubit>().updateIndex(index),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 32),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined, size: 32),
                label: "My Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, size: 32),
                label: "My Account",
              ),
            ],
          ),
        ),
      );
      }
    );
  }
}