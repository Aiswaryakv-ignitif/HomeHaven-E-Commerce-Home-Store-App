// --- 1. YOUR DATA LIST ---
final List<Map<String, dynamic>> furnitureProducts = [
  {
    "name": "EKERÖ",
    "images": {
      "image1": "assets/ekero_1.png",
      "image2": "assets/ekero_2.png",
      "image3": "assets/ekero_3.png",
    },
    "originalPrice": 512.58,
    "discountPercentage": 45,
    "rating": 4.9,
    "reviews": 256,
    "colors": [
      {"name": "Harvest Gold", "hex": 0xFFEBB65B},
      {"name": "Eerie Black", "hex": 0xFF252525},
      {"name": "Soft Grey", "hex": 0xFFB0B0B0},
    ],
    "about":
        "A minimalist armchair with a reversible back cushion that provides soft support for your back. Designed for comfort and durability, perfect for modern living spaces.",
  },
  {
    "name": "STRANDMON",
    "images": {
      "image1": "assets/strandmon_1.png",
      "image2": "assets/strandmon_2.png",
      "image3": "assets/strandmon_3.png",
    },
    "originalPrice": 856.60,
    "discountPercentage": 45,
    "rating": 4.8,
    "reviews": 128,
    "colors": [
      {"name": "Grey", "hex": 0xFF808080},
      {"name": "Navy Blue", "hex": 0xFF1B3A57},
      {"name": "Dark Green", "hex": 0xFF1E5631},
    ],
    "about":
        "A classic wing chair with timeless design and excellent back support. Ideal for reading corners and cozy living rooms.",
  },
  {
    "name": "POÄNG",
    "images": {
      "image1": "assets/poaeng_1.png",
      "image2": "assets/poaeng_2.png",
      "image3": "assets/poaeng_3.png",
    },
    "originalPrice": 399.99,
    "discountPercentage": 30,
    "rating": 4.7,
    "reviews": 342,
    "colors": [
      {"name": "Birch", "hex": 0xFFD7B899},
      {"name": "Black Brown", "hex": 0xFF3B2F2F},
      {"name": "White", "hex": 0xFFFFFFFF},
    ],
    "about":
        "A lightweight and flexible armchair with a layered-glued bentwood frame that gives a comfortable springy feel.",
  },
  {
    "name": "MALM Chair",
    "images": {
      "image1": "assets/malm_1.png",
      "image2": "assets/malm_2.png",
      "image3": "assets/malm_3.png",
    },
    "originalPrice": 289.50,
    "discountPercentage": 40,
    "rating": 4.6,
    "reviews": 198,
    "colors": [
      {"name": "White", "hex": 0xFFFFFFFF},
      {"name": "Oak", "hex": 0xFFB08968},
      {"name": "Black", "hex": 0xFF000000},
    ],
    "about":
        "A simple and sturdy chair with a clean design that fits seamlessly into bedrooms, offices, or dining areas.",
  },
  // {
  //   "name": "LANDSKRONA",
  //   "images": {
  //     "image1": "assets/landskrona_main.png",
  //     "image2": "assets/landskrona_2.png",
  //     "image3": "assets/landskrona_3.png",
  //   },
  //   "originalPrice": 1249.00,
  //   "discountPercentage": 35,
  //   "rating": 4.8,
  //   "reviews": 89,
  //   "colors": [
    //   {"name": "Dark Grey", "hex": 0xFF4F4F4F},
    //   {"name": "Golden Brown", "hex": 0xFF996515},
    //   {"name": "Green", "hex": 0xFF2E8B57},
    // ],
  //   "about":
  //       "A premium sofa with deep seats and durable leather upholstery, offering long-lasting comfort and elegant style.",
  // },
  // {
  //   "name": "PLATTLÄNS Lamp",
  //   "images": {
  //     "image1": "assets/furnitures/plattlans_main.png",
  //     "image2": "assets/furnitures/plattlans_2.png",
  //     "image3": "assets/furnitures/plattlans_3.png",
  //   },
  //   "originalPrice": 69.99,
  //   "discountPercentage": 45,
  //   "rating": 4.5,
  //   "reviews": 412,
  //   "colors": ["Yellow", "White", "Black"],
  //   "about":
  //       "A stylish pendant lamp that provides focused lighting, perfect for dining areas, kitchens, and modern interiors.",
  // },
  // {
  //   "name": "FÄRLÖV Sofa",
  //   "images": {
  //     "image1": "assets/furnitures/farlov_main.png",
  //     "image2": "assets/furnitures/farlov_2.png",
  //     "image3": "assets/furnitures/farlov_3.png",
  //   },
  //   "originalPrice": 1599.00,
  //   "discountPercentage": 25,
  //   "rating": 4.7,
  //   "reviews": 76,
  //   "colors": [
    //   {"name": "Yellow", "hex": 0xFFFFD700},
    //   {"name": "White", "hex": 0xFFFFFFFF},
    //   {"name": "Black", "hex": 0xFF000000},
    // ],
  //   "about":
  //       "A deep, comfortable sofa with plush cushions and removable covers, designed for relaxed lounging and family comfort.",
  // },
  // {
  //   "name": "KIVIK Armchair",
  //   "images": {
  //     "image1": "assets/furnitures/kivik_main.png",
  //     "image2": "assets/furnitures/kivik_2.png",
  //     "image3": "assets/furnitures/kivik_3.png",
  //   },
  //   "originalPrice": 749.00,
  //   "discountPercentage": 40,
  //   "rating": 4.6,
  //   "reviews": 221,
  //    "colors": [
    //   {"name": "Light Beige", "hex": 0xFFF5F5DC},
    //   {"name": "Dark Grey", "hex": 0xFF4F4F4F},
    //   {"name": "Blue", "hex": 0xFF1E90FF},
    // ],
  //   "about":
  //       "A generous armchair with low armrests and memory foam cushions that adapt to your body for superior comfort.",
  // },
];
