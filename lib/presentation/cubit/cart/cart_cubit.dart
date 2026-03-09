import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cart_state.dart';
import 'dart:convert';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartLoaded(cartItems: [], totalPrice: 0.0));

  double _calculateTotal(List<Map<String, dynamic>> items) {
    return items.fold(0.0, (sum, item) {
      final double price = (item['originalPrice'] ?? 0.0).toDouble();
      final int discount = item['discount'] ?? 0;
      final int quantity = item['quantity'] ?? 1;

      final double discountedPrice = price * (1 - (discount / 100));
      return sum + (discountedPrice * quantity);
    });
  }

  Future<void> loadCart() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? cartString = prefs.getString("cart_items");

      if (cartString == null) {
        emit(CartLoaded(cartItems: [], totalPrice: 0.0));
        return;
      }

      final List decodedList = jsonDecode(cartString);

      final List<Map<String, dynamic>> cartItems = decodedList
          .map((e) => Map<String, dynamic>.from(e))
          .toList();

      emit(
        CartLoaded(
          cartItems: cartItems,
          totalPrice: _calculateTotal(cartItems),
        ),
      );
    } catch (e) {
      emit(CartLoaded(cartItems: [], totalPrice: 0.0));
    }
  }

  Future<void> _saveCart(List<Map<String, dynamic>> items) async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = jsonEncode(items);
    await prefs.setString("cart_items", encodedData);
  }

  // void addToCart(Map<String, dynamic> item) {
  //   if (state is CartLoaded) {
  //     final currentItems = (state as CartLoaded).cartItems;
  //     //final updatedList = List<Map<String, dynamic>>.from(currentItems)..add(item);

  //     // final updatedList = List<Map<String, dynamic>>.from(currentItems);
  //     // updatedList.insert(0, item);

  //     final updatedList = [item, ...currentItems];
  //     emit(CartLoaded(cartItems: updatedList,totalPrice: _calculateTotal(updatedList),));
  //   }
  // }

  Future<void> addToCart(Map<String, dynamic> newItem) async {
    if (state is CartLoaded) {
      // 1. Get the current list from the state
      final currentItems = List<Map<String, dynamic>>.from(
        (state as CartLoaded).cartItems,
      );

      // 2. Check if this exact product with this exact color already exists
      int existingIndex = currentItems.indexWhere(
        (item) =>
            item['id'] == newItem['id'] && item['color'] == newItem['color'],
      );

      List<Map<String, dynamic>> updatedList;

      if (existingIndex != -1) {
        // 3. If it exists, create a copy of the item and increment quantity
        final updatedItem = Map<String, dynamic>.from(
          currentItems[existingIndex],
        );
        updatedItem['quantity'] = (updatedItem['quantity'] ?? 1) + 1;

        updatedList = currentItems;
        updatedList[existingIndex] = updatedItem;
      } else {
        // 4. If it's new (or a different color), add it to the top
        updatedList = [newItem, ...currentItems];
      }

      emit(
        CartLoaded(
          cartItems: updatedList,
          totalPrice: _calculateTotal(updatedList),
        ),
      );

      await _saveCart(updatedList);
    }
  }

  Future<void> incrementQuantity(int index) async {
    if (state is CartLoaded) {
      final updatedList = List<Map<String, dynamic>>.from(
        (state as CartLoaded).cartItems,
      );
      final updatedItem = Map<String, dynamic>.from(updatedList[index]);

      updatedItem['quantity']++;
      updatedList[index] = updatedItem;

      emit(
        CartLoaded(
          cartItems: updatedList,
          totalPrice: _calculateTotal(updatedList),
        ),
      );
      await _saveCart(updatedList);
    }
  }

  Future<void> decrementQuantity(int index) async {
    if (state is CartLoaded) {
      final updatedList = List<Map<String, dynamic>>.from(
        (state as CartLoaded).cartItems,
      );
      final updatedItem = Map<String, dynamic>.from(updatedList[index]);

      if (updatedItem['quantity'] > 1) {
        updatedItem['quantity']--;
        updatedList[index] = updatedItem;
        emit(
          CartLoaded(
            cartItems: updatedList,
            totalPrice: _calculateTotal(updatedList),
          ),
        );
        await _saveCart(updatedList);
      } else {
        removeFromCart(index);
      }
    }
  }

  Future<void> removeFromCart(int index) async {
    if (state is CartLoaded) {
      final updatedList = List<Map<String, dynamic>>.from(
        (state as CartLoaded).cartItems,
      )..removeAt(index);
      emit(
        CartLoaded(
          cartItems: updatedList,
          totalPrice: _calculateTotal(updatedList),
        ),
      );
      await _saveCart(updatedList);
    }
  }

  Future<void> toggleSelection(int index) async {
    if (state is CartLoaded) {
      final updatedList = List<Map<String, dynamic>>.from(
        (state as CartLoaded).cartItems,
      );
      final updatedItem = Map<String, dynamic>.from(updatedList[index]);

      // Flip the selection status
      updatedItem['isSelected'] = !(updatedItem['isSelected']);

      updatedList[index] = updatedItem;
      emit(
        CartLoaded(
          cartItems: updatedList,
          totalPrice: _calculateTotal(updatedList),
        ),
      );
      await _saveCart(updatedList);
    }
  }

  Future<void> checkout() async {
    if (state is CartLoaded) {
      emit(CartOrderSuccess());

      final emptyList = <Map<String, dynamic>>[];
      await _saveCart(emptyList);

      emit(CartLoaded(cartItems: [], totalPrice: 0.0));
    }
  }
}
