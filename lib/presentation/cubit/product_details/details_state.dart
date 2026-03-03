abstract class ProductDetailsState {}

/// Initial state
class ProductDetailsInitial extends ProductDetailsState {}

/// Loading state
class ProductDetailsLoading extends ProductDetailsState {}

/// Loaded state
class ProductDetailsLoaded extends ProductDetailsState {
  final Map<String, dynamic> product;
  final int selectedColorIndex;
  // final bool isFavorite;
  final bool showSuccessMessage;
  // final bool isAddedToCart;
  final Set<int> addedIndices; // Store indices here: {0, 2}
  final int selectedImageIndex;

  ProductDetailsLoaded({
    required this.product,
    required this.selectedColorIndex,
    // this.isFavorite = false,
    this.showSuccessMessage = false,
    // this.isAddedToCart = false,
    this.addedIndices = const {},
    required this.selectedImageIndex,
  });

  // The copyWith method
  ProductDetailsLoaded copyWith({
    Map<String, dynamic>? product,
    int? selectedColorIndex,
    // bool? isFavorite,
    bool? showSuccessMessage,
    // bool? isAddedToCart,
    Set<int>? addedIndices,
    int? selectedImageIndex,
  }) {
    return ProductDetailsLoaded(
      // Use the new value if provided, otherwise keep the current one
      product: product ?? this.product,
      selectedColorIndex: selectedColorIndex ?? this.selectedColorIndex,
      // isFavorite: isFavorite ?? this.isFavorite,
      showSuccessMessage: showSuccessMessage ?? this.showSuccessMessage,
      // isAddedToCart: isAddedToCart ?? this.isAddedToCart,
      addedIndices: addedIndices ?? this.addedIndices,
      selectedImageIndex: selectedImageIndex ?? this.selectedImageIndex,
    );
  }
}

/// Add to cart success state (for showing snackbar)
class AddCurrentProductToCart extends ProductDetailsState {}
