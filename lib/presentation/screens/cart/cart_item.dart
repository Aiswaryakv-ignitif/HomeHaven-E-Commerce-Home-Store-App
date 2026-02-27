import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_haven/presentation/cubit/cart/cart_cubit.dart';
import 'package:home_haven/presentation/cubit/favorites/favorites_cubit.dart';
import 'package:home_haven/presentation/cubit/favorites/favorites_state.dart';

class CartItemCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final int index;

  const CartItemCard({super.key, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    // Extract values safely using your specific keys
    final double originalPrice = (item['originalPrice'] ?? 0.0).toDouble();
    final int discountPercent = item['discount'] ?? 0;

    // Calculate the discounted price: Price * (1 - discount/100)
    final double discountedPrice =
        originalPrice * (1 - (discountPercent / 100));

    return Card(
      elevation: 1,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // 1. Image (Note: Using Image.asset since your path is 'assets/...')
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                item['image'],
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 14),
            // 2. Info Column
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'].toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Color(0xFF404040), fontSize: 16),
                  ),
                
                  // Display calculated discounted price
                  Text(
                    "\$${discountedPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: Color(0xFF404040),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      // Display Original Price with strikethrough
                      Text(
                        "\$${originalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Color(0xFF404040),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE44A4A),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          "$discountPercent% OFF",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 2),
                  Text(
                    item['color'],
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  // const SizedBox(height: 8),
                  // 3. Favorite & Quantity Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //  GestureDetector(
                      //   onTap: () => context.read<CartCubit>().toggleSelection(index),
                      //    child: Icon(
                      //       item['isSelected'] == true ? Icons.favorite : Icons.favorite_border,
                      //     // item['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                      //     color: item['isSelected'] ? Color(0XFF156651) : Colors.grey,
                      //     size: 22,
                      //      ),
                      //  ),



                      // 1. GLOBAL FAVORITE HEART ICON
    BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, favState) {
        // We use the 'id' and 'color' we just added to the cart item
        final bool isFav = context.read<FavoritesCubit>().isFavorite(
          item['id'], 
          item['color'],
        );

        return GestureDetector(
          onTap: () {
            // Toggles favorite status globally
            context.read<FavoritesCubit>().toggleFavorite(
              item['id'], 
              item['color'],
            );
          },
          child: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            // Use your theme color when favorited, grey when not
            color: isFav ? const Color(0XFF156651) : Colors.grey,
            size: 22,
          ),
        );
      },
    ),

                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 6),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300,width: 2),
                          borderRadius: BorderRadius.circular(8),
                          
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              // constraints: const BoxConstraints(),
                              // padding: const EdgeInsets.all(4),
                              onTap: () => context
                                  .read<CartCubit>()
                                  .decrementQuantity(index),
                              child: Icon(
                                Icons.remove,
                                size: 26,
                                color: Color(0XFF156651),
                              ),
                            ),
                            Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 18),
                              child: Text(
                                "${item['quantity']}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF404040),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            GestureDetector(
                              // constraints: const BoxConstraints(),
                              // padding: const EdgeInsets.all(4),
                              onTap: () => context
                                  .read<CartCubit>()
                                  .incrementQuantity(index),
                              child: const Icon(
                                Icons.add,
                                size: 26,
                                color: Color(0XFF156651),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
