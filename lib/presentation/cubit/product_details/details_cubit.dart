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
      showSuccessMessage: false,
      selectedImageIndex: 0,
      
    ));
  }

  /// Change selected color
  void changeColor(int index) {
    if (state is ProductDetailsLoaded) {
      final currentState = state as ProductDetailsLoaded;

      emit(ProductDetailsLoaded(
        product: currentState.product,
        selectedColorIndex: index,
        showSuccessMessage: currentState.showSuccessMessage,
        addedIndices:currentState.addedIndices,
        selectedImageIndex: 0,
      ));

    }
  }


  void changeImage(int index) {
    if (state is ProductDetailsLoaded) {
      final currentState = state as ProductDetailsLoaded;

      emit(currentState.copyWith(
        selectedImageIndex: index,
        showSuccessMessage: false,
      ));
    }
  }

  /// Add to cart

  void addCurrentProductToCart(CartCubit cartCubit) {
  if (state is ProductDetailsLoaded) {
    final currentState = state as ProductDetailsLoaded;
    final currentIndex = currentState.selectedColorIndex;

    // 1. Prepare data
    final itemForCart = {
      'id':currentState.product['id'],
      'name': currentState.product['name'],
      'color': currentState.product['colors'][currentState.selectedColorIndex]['name'],
      // 'color': (currentState.product['colors'][currentState.selectedColorIndex]['name'] as String).trim().split(' ').last,
      'originalPrice': currentState.product['originalPrice'],
      'discount': currentState.product['discountPercentage'],
      'image': currentState.product['colors']
            [currentState.selectedColorIndex]['images']
            [0],
      'quantity': 1,
     
    };

    // 2. Add to Global Cart
    cartCubit.addToCart(itemForCart);
    // Notice: No emit here! We stay in the Loaded state.

    final updatedIndices = Set<int>.from(currentState.addedIndices)..add(currentIndex);

    // 3. Trigger the Snackbar
    // This creates a NEW state object with showSuccessMessage set to true
     emit(currentState.copyWith(showSuccessMessage: true,addedIndices: updatedIndices,));
    



    // 4. Reset the trigger immediately
    // This creates a NEW state object with showSuccessMessage set to false
    emit(currentState.copyWith(showSuccessMessage: false,addedIndices: updatedIndices,));
  }
}
}

