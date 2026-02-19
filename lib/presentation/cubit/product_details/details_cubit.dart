import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_haven/presentation/cubit/cart/cart_cubit.dart';
import 'package:home_haven/presentation/cubit/product_details/details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {

  ProductDetailsCubit() : super(ProductDetailsInitial());

  /// Load product when page opens
  void loadProduct(Map<String, dynamic> product) async {
    emit(ProductDetailsLoading());

    await Future.delayed(const Duration(milliseconds: 300));

    emit(ProductDetailsLoaded(
      product: product,
      selectedColorIndex: 0, // default first color
      isFavorite: false ,
      showSuccessMessage: false,
    ));
  }

  /// Change selected color
  void changeColor(int index) {
    if (state is ProductDetailsLoaded) {
      final currentState = state as ProductDetailsLoaded;

      emit(ProductDetailsLoaded(
        product: currentState.product,
        selectedColorIndex: index,
        isFavorite: currentState.isFavorite,
        showSuccessMessage: currentState.showSuccessMessage,
      ));
    }
  }

  void toggleFavorite() {
  if (state is ProductDetailsLoaded) {
    final currentState = state as ProductDetailsLoaded;

    emit(currentState.copyWith(isFavorite: !currentState.isFavorite));
    // or
    // emit(ProductDetailsLoaded(
    //   product: currentState.product,
    //   selectedColorIndex: currentState.selectedColorIndex,
    //   isFavorite: !currentState.isFavorite, // The '!' means 'the opposite'
    //   showSuccessMessage: currentState.showSuccessMessage,
    // ));
  }
}

  /// Add to cart

  void addCurrentProductToCart(CartCubit cartCubit) {
  if (state is ProductDetailsLoaded) {
    final currentState = state as ProductDetailsLoaded;

    // 1. Prepare data
    final itemForCart = {
      'name': currentState.product['name'],
      'color': currentState.product['colors'][currentState.selectedColorIndex]['name'],
      'originalPrice': currentState.product['originalPrice'],
      'discount': currentState.product['discountPercentage'],
      'image': currentState.product['images']['image1'],
      'quantity': 1,
      'isSelected': currentState.isFavorite,
    };

    // 2. Add to Global Cart
    cartCubit.addToCart(itemForCart);
    // Notice: No emit here! We stay in the Loaded state.

    // 3. Trigger the Snackbar
    // This creates a NEW state object with showSuccessMessage set to true
    emit(currentState.copyWith(showSuccessMessage: true));

    // or
//     emit(ProductDetailsLoaded(
//   product: currentState.product,
//   selectedColorIndex: currentState.selectedColorIndex,
//   isFavorite: currentState.isFavorite,
//   showSuccessMessage: true, // Only this changed!
// ));

    // 4. Reset the trigger immediately
    // This creates a NEW state object with showSuccessMessage set to false
    emit(currentState.copyWith(showSuccessMessage: false));
  }
}
}
