import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_haven/core/data/furniture.dart';
import 'home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  // Action 1: Load the data
  void loadFurniture() async {
    emit(HomeLoading());
    
    // Even though it's local, we add a tiny delay so the user 
    // sees a smooth transition (and to simulate a real app)
    await Future.delayed(const Duration(milliseconds: 500));
    
    if (furnitureProducts.isNotEmpty) {
      emit(HomeLoaded(furnitureProducts));
    } else {
      emit(HomeError("No products found"));
    }
  }

  // Action 2: Prepare for navigation
  void selectProduct(Map<String, dynamic> product) {
    emit(HomeNavigateToDetails(product));
    //emit(HomeLoaded(furnitureProducts));
  }
}