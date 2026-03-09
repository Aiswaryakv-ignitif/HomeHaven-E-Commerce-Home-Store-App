import 'package:flutter_bloc/flutter_bloc.dart';
import 'favorites_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());


  //  Load from SharedPreferences
  Future<void> loadFavorites() async {
    emit(FavoritesLoading());

    try {
      final prefs = await SharedPreferences.getInstance();

      final List<String> savedFavorites =
          prefs.getStringList("favorites") ?? [];

      emit(FavoritesLoaded(savedFavorites));
    } catch (e) {
      emit(FavoritesError("Failed to load favorites"));
    }
  }

 //  Toggle + Save
  Future<void> toggleFavorite(dynamic productId, String colorName) async {
    if (state is FavoritesLoaded) {
      final String key = "${productId}_$colorName";
      final currentList = (state as FavoritesLoaded).favoriteKeys;

      final List<String> updatedList = [...currentList];

      if (updatedList.contains(key)) {
        updatedList.remove(key);
      } else {
        updatedList.add(key);
      }

      //  Save to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList("favorites", updatedList);

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