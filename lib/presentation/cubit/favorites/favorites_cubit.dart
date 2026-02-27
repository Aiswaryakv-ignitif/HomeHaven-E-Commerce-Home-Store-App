import 'package:flutter_bloc/flutter_bloc.dart';
import 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  // Call this to initialize data
  void loadFavorites() async {
    emit(FavoritesLoading());
    try {
      // Simulating a fetch from storage
      await Future.delayed(const Duration(milliseconds: 200));
      emit(FavoritesLoaded([])); 
    } catch (e) {
      emit(FavoritesError("Failed to load favorites"));
    }
  }

  void toggleFavorite(dynamic productId, String colorName) {
    if (state is FavoritesLoaded) {
      final String key = "${productId}_$colorName";
      final currentList = (state as FavoritesLoaded).favoriteKeys;
      
      // Photocopy the list (Immutability)
      final List<String> updatedList = [...currentList];

      if (updatedList.contains(key)) {
        updatedList.remove(key);
      } else {
        updatedList.add(key);
      }

      emit(FavoritesLoaded(updatedList));
    }
  }

  // Helper to check status in UI
  bool isFavorite(dynamic productId, String colorName) {
    if (state is FavoritesLoaded) {
      return (state as FavoritesLoaded).favoriteKeys.contains("${productId}_$colorName");
    }
    return false;
  }
}