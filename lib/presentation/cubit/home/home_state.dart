abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Map<String, dynamic>> products;
  HomeLoaded(this.products);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}

// State to trigger the navigation "event"
class HomeNavigateToDetails extends HomeState {
  final Map<String, dynamic> product;
  HomeNavigateToDetails(this.product);
}