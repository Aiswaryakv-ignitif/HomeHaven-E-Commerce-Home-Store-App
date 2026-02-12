import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_haven/presentation/cubit/bottom_navigation/bottom_nav_state.dart';

class NavbarCubit extends Cubit<NavbarState> {
  // Initialize the Cubit with the default state (index 0)
  NavbarCubit() : super(NavbarState());

  
  void updateIndex(int index) {
    emit(NavbarState(selectedIndex: index));
  }
}