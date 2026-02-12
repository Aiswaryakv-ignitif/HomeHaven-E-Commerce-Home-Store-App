import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/data/furniture.dart';

// --- 2. MAIN UI CODE ---
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SearchBar(
                        hintText: "Search candles",
                        hintStyle: WidgetStateProperty.all(
                          GoogleFonts.manrope(color: const Color(0xFF9E9E9E)),
                        ),

                        elevation: WidgetStateProperty.all(0),
                        backgroundColor: WidgetStateProperty.all(Colors.white),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        side: WidgetStateProperty.all(
                          BorderSide(color: Colors.grey.shade300),
                        ),
                        leading: const Icon(
                          Icons.search,
                          color: Color(0xFF000000),
                        ),
                        trailing: [
                          const Icon(
                            Icons.camera_alt_outlined,
                            color: Color(0xFF404040),
                          ),
                        ],
                        padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(
                      Icons.notifications_none_outlined,
                      size: 28,
                      color: Color(0xFF404040),
                    ),
                  ],
                ),
              ),

             
              // Location Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 24,
                      color: Color(0xFF000000),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      "Deliver to ",
                      style: GoogleFonts.manrope(
                        color: const Color(0xFF404040),
                        fontSize: 15,
                      ),
                    ),
                    // --- WRAP THE ADDRESS IN EXPANDED ---
                    Expanded(
                      child: Text(
                        "3517 W. Gray St. Utica, Pennsylvania 12345", // Use the full address now!
                        style: GoogleFonts.manrope(
                          color: const Color(0xFF404040),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        overflow: TextOverflow
                            .ellipsis, // Adds the "..." automatically
                        maxLines: 1, // Keeps it on one line
                      ),
                    ),

                    const SizedBox(
                      width: 8,
                    ), 
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Promo Banner Section
              Container(
                height: 223,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                   
                    image: AssetImage("assets/banner.jpeg"),
                    fit: BoxFit.cover,
                    // colorFilter: ColorFilter.mode(
                    //   const Color(0xFF156651).withValues(
                    //     alpha: 0.1,
                    //   ), // Adjust opacity to see more/less image
                    //   BlendMode
                    //       .darken, // 'darken' or 'multiply' work best for this effect
                    // ),
                  ),
                ),
                child: Container(
                  // We add a second decoration to create a smooth fade from solid green to transparent
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        const Color(
                          0xFF156651,
                        ).withValues(alpha: 1.0), // Solid-ish green on the left
                        const Color(0xFF156651).withValues(alpha: 0.67),
                        const Color(0xFF156651).withValues(
                          alpha: 0.0,
                        ),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Celebrate The\nSeason With Us!",
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Get discounts up to 75% for\nfurniture & decoration",
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 14,
                            fontFamily: "Manrope",
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF156651),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            "Shop Now",
                            style: TextStyle(
                              fontFamily: "Manrope",
                              color: Color(0xFF156651),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Special Offers Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Special Offers",
                      style: TextStyle(
                        fontFamily: "Manrope",
                        color: const Color(0xFF404040),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "See More",
                        style: TextStyle(
                          color: Color(0xFF156651),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFF156651),
                          fontSize: 18,
                          fontFamily: "Manrope",
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // The SizedBox "frames" the whole scrolling area
              SizedBox(
                height: 290,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16),
                  itemCount: furnitureProducts.length,
                  itemBuilder: (context, index) {
                    final item = furnitureProducts[index];
                    double original = item['originalPrice'];
                    double finalPrice =
                        original * (1 - (item['discountPercentage'] / 100));

                    // Using Card here instead of a plain Container
                    return Card(
                      elevation:2, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      color: Colors.white,
                      child: Container(
                        width: 170,
                        padding: const EdgeInsets.all(
                          16.0,
                        ), // Padding inside the card
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                SizedBox(width: 100),
                                // Image Area
                                ClipRRect(
                                  // Clips the image to match card corners
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    height: 150,
                                    width: double.infinity,
                                    color:  const Color(0xFFFFFFFF),
                                    child: Image.asset(
                                      item['images']["image1"],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                // Discount Badge
                                Positioned(
                                  bottom: 8,
                                  left: 8,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE44A4A),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      "${item['discountPercentage']}% OFF",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Manrope",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item['name'],
                              style: const TextStyle(
                                color: Color(0xFF404040),
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "\$${finalPrice.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Manrope",
                              ),
                            ),
                            Text(
                              "\$${original.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xFF404040),
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),

                            //const Spacer(), // Pushes the rating to the bottom
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color(0xFFEBB65B),
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "${item['rating']} (${item['reviews']})",
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF404040),
                                    fontFamily: "Manrope",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

             
           
            ],
          ),
        ),
      );
   
  }
}
