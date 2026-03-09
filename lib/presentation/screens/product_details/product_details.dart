import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_haven/presentation/cubit/cart/cart_cubit.dart';
import 'package:home_haven/presentation/cubit/favorites/favorites_cubit.dart';
import 'package:home_haven/presentation/cubit/favorites/favorites_state.dart';
import 'package:home_haven/presentation/cubit/product_details/details_cubit.dart';
import 'package:home_haven/presentation/cubit/product_details/details_state.dart';
import 'package:home_haven/presentation/widgets/auth/button.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final CarouselSliderController _carouselController =CarouselSliderController();
  late ProductDetailsCubit _detailsCubit;

  @override
  void initState() {
    super.initState();
    // Initialize the Cubit once in the 'Vault'
    _detailsCubit = ProductDetailsCubit()..loadProduct(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double dynamicWidth = (screenWidth - 32 - 12) / 2;

    // return BlocProvider(
    // create: (context) => ProductDetailsCubit()..loadProduct(widget.product),
    return BlocProvider.value(
      value: _detailsCubit,
      child: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
        listener: (context, state) {
          if (state is ProductDetailsLoaded && state.showSuccessMessage) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Added to cart successfully"),
                duration: Duration(seconds: 1),
                backgroundColor: Color(0XFF156651),
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ProductDetailsLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (state is ProductDetailsLoaded) {
            final product = state.product;
            final selectedColorIndex = state.selectedColorIndex;
            final selectedImageIndex = state.selectedImageIndex;

            final String currentColorName =product['colors'][selectedColorIndex]['name'];
            
            final isCurrentVariantAdded = state.addedIndices.contains(state.selectedColorIndex,);
          
            final List<String> images = List<String>.from(
              product['colors'][selectedColorIndex]['images'],
            );

            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // 1. Large Product Image
                      ///  CAROUSEL
                      CarouselSlider.builder(
                        carouselController: _carouselController,
                        itemCount: images.length,
                        options: CarouselOptions(
                          height: 300,
                          viewportFraction: 1,
                          enableInfiniteScroll: false,
                          initialPage: selectedImageIndex,
                          onPageChanged: (index, reason) {
                            context.read<ProductDetailsCubit>().changeImage(
                              index,
                            );
                          },
                        ),
                        itemBuilder: (context, index, realIndex) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.contain,
                            ),
                          );
                        },
                      ),

                      // 2. Small Gallery Preview
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(images.length, (index) {
                            return GestureDetector(
                              onTap: () => _carouselController.jumpToPage(index),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                child: _buildGalleryItem(
                                  images[index],
                                  selectedImageIndex  == index,
                                ),
                              ),
                            );
                          }),
                        ),
                      ),

                      // 3. Product Info Card (Rounded Top)
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 244, 242, 242),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product['name'].toString().toUpperCase(),
                                    style: GoogleFonts.manrope(
                                      fontSize: 16,
                                      color: const Color(0xFF404040),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        "\$${(product['originalPrice'] * (1 - (product['discountPercentage'] / 100))).toStringAsFixed(2)}",
                                        style: GoogleFonts.manrope(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w800,

                                          color: Color(0xFF404040),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        "\$${product['originalPrice'].toStringAsFixed(2)}",
                                        style: GoogleFonts.manrope(
                                          fontSize: 16,
                                          color: Color(0xFF404040),
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE44A4A),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8),
                                          ),
                                        ),
                                        child: Text(
                                          "${product['discountPercentage']}% OFF",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Color(0xFFEBB65B),
                                        size: 20,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        "${product['rating']} (${product['reviews']})",
                                        style: GoogleFonts.manrope(
                                          color: Color(0xFF404040),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "A minimalist chair with a reversible back cushion provides soft support for your back and has two sides to wear.",
                                    style: GoogleFonts.manrope(
                                      fontSize: 18,
                                      color: const Color(0xFF404040),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const Divider(
                              color: Color(0xFFC2C2C2),
                              thickness: 1,
                            ),
                            const SizedBox(height: 14),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Colors",
                                    style: GoogleFonts.manrope(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 12),

                                  Wrap(
                                    spacing: 12, // horizontal gap between items
                                    runSpacing:
                                        12, // vertical gap if they wrap to next line
                                    children: (product['colors'] as List)
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                          int index = entry.key;
                                          var colorData = entry.value;
                                          return SizedBox(
                                            width: dynamicWidth,
                                            child: _buildColorOption(
                                              colorData['name'],
                                              Color(colorData['hex']),
                                              isSelected:
                                                  selectedColorIndex == index,
                                              onTap: () {
                                                // Tell the cubit to change the index
                                            context.read<ProductDetailsCubit>().changeColor(index);
                                            // 2. Reset carousel to first image of new color
                                            _carouselController.jumpToPage(0);
                                              },
                                            ),
                                          );
                                        })
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 100),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                height: 120,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255,0,0,0,).withValues(alpha: 0.1),
                      blurRadius: 5,
                      // offset:  Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // 2.  FAVORITE LOGIC
                    BlocBuilder<FavoritesCubit, FavoritesState>(
                      builder: (context, favState) {
                        // We check the global favorite status using our helper
                        final bool isFav = context.read<FavoritesCubit>().isFavorite(product['id'], currentColorName);

                        return GestureDetector(
                          onTap: () {
                            context.read<FavoritesCubit>().toggleFavorite(
                              product['id'],
                              currentColorName,
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF156651),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                              color: const Color(0xFF156651),
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(width: 16),

      
                    Expanded(
                      child:isCurrentVariantAdded? OutlinedButton(
                              onPressed:
                                  null, // Makes the button look disabled/inactive
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                side: const BorderSide(
                                  color: Color(0xFF156651),
                                  width: 1.5,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                "Added to Cart",
                                style: GoogleFonts.manrope(
                                  color: const Color(0xFF156651),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          : AuthButton(
                              text: "Add to Cart",
                              onPressed: () {
                                context
                                    .read<ProductDetailsCubit>()
                                    .addCurrentProductToCart(
                                      context.read<CartCubit>(),
                                    );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildGalleryItem(String imagePath, bool isActive ) {
    return Container(
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isActive ? const Color(0xFF156651) : Colors.transparent,
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    );
  }

  // --- Helper Widget for Color Selector ---
  Widget _buildColorOption(
    String name,
    Color color, {
    bool isSelected = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF156651)
                : const Color(0xFFE0E0E0),
            width: 2,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(name, style: GoogleFonts.manrope(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}
