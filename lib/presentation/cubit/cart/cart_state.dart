abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<Map<String, dynamic>> cartItems;
  final double totalPrice;
  CartLoaded({required this.cartItems,required this.totalPrice});
}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}

class CartOrderSuccess extends CartState {}