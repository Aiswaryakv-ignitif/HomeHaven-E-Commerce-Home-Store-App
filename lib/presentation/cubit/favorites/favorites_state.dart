abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  // Composite keys like "1_Harvest Gold"
  final List<String> favoriteKeys; 
  FavoritesLoaded(this.favoriteKeys);
}

class FavoritesError extends FavoritesState {
  final String message;
  FavoritesError(this.message);
}