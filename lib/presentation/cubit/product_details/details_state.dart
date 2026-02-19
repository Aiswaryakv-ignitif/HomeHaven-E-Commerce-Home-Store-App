abstract class ProductDetailsState {}

/// Initial state
class ProductDetailsInitial extends ProductDetailsState {}

/// Loading state
class ProductDetailsLoading extends ProductDetailsState {}

/// Loaded state
class ProductDetailsLoaded extends ProductDetailsState {
  final Map<String, dynamic> product;
  final int selectedColorIndex;
  final bool isFavorite;
  final bool showSuccessMessage;

  ProductDetailsLoaded({
    required this.product,
    required this.selectedColorIndex,
    this.isFavorite = false,
    this.showSuccessMessage = false,
  });

  // The copyWith method
  ProductDetailsLoaded copyWith({
    Map<String, dynamic>? product,
    int? selectedColorIndex,
    bool? isFavorite,
    bool? showSuccessMessage,
  }) {
    return ProductDetailsLoaded(
      // Use the new value if provided, otherwise keep the current one
      product: product ?? this.product,
      selectedColorIndex: selectedColorIndex ?? this.selectedColorIndex,
      isFavorite: isFavorite ?? this.isFavorite,
      showSuccessMessage: showSuccessMessage ?? this.showSuccessMessage,
    );
  }
}

/// Add to cart success state (for showing snackbar)
class AddCurrentProductToCart extends ProductDetailsState {}
