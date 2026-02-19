import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_haven/presentation/cubit/cart/cart_cubit.dart';
import 'package:home_haven/presentation/cubit/cart/cart_state.dart';
import 'package:home_haven/presentation/screens/cart/cart_item.dart';
import 'package:home_haven/presentation/widgets/auth/button.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Custom Header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "My Cart",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF404040),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none_outlined,
                    size: 28,
                    color: Color(0xFF404040),
                  ),
                ),
              ],
            ),
          ),

          // List View
          Expanded(
            child: BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {
                if (state is CartOrderSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Order placed successfully!"),
                      backgroundColor: Color(0XFF156651),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
              builder: (context, state) {
                return BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is CartLoaded) {
                      if (state.cartItems.isEmpty) {
                        return const Center(child: Text("Your cart is empty"));
                      }
                      return Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              itemCount: state.cartItems.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 10),
                              itemBuilder: (context, index) {
                                return CartItemCard(
                                  item: state.cartItems[index],
                                  index: index,
                                );
                              },
                            ),
                          ),

                          // 🔹 Total + Checkout Section
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                top: BorderSide(color: Colors.grey.shade200),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Total:",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFF404040),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "\$${state.totalPrice.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF404040),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),

                                // SizedBox(
                                //   width: double.infinity,
                                //   height: 55,
                                //   child: ElevatedButton(
                                //     onPressed: () {},
                                //     style: ElevatedButton.styleFrom(
                                //       backgroundColor: const Color(0XFF156651),
                                //       shape: RoundedRectangleBorder(
                                //         borderRadius: BorderRadius.circular(12),
                                //       ),
                                //       elevation: 0,
                                //     ),
                                //     child: const Text(
                                //       "Checkout",
                                //       style: TextStyle(
                                //         fontSize: 18,
                                //         fontWeight: FontWeight.bold,
                                //         color: Colors.white,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                AuthButton(
                                  text: "Checkout",
                                  onPressed: () {
                                    context.read<CartCubit>().checkout();
                                  },
                                ),

                                // ++++++++
                              ],
                            ),
                          ),
                          // =======
                        ],
                      );
                    }
                    if (state is CartError) {
                      return Center(child: Text(state.message));
                    }

                    return const Center(child: CircularProgressIndicator());
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
