// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:home_haven/presentation/cubit/onboard/onboarding_cubit.dart';
// import 'package:home_haven/presentation/cubit/onboard/onboarding_state.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'header_clipper.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController _pageController = PageController();

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   final List<Map<String, String>> onboardingData = [
//     {
//       "title": "Online Home Store and Furniture",
//       "desc":
//           "Discover all style and budgets of furniture, appliances, kitchen, and more from 500+ brands in your hand.",
//       "image": "assets/onboarding1.png",
//     },
//     {
//       "title": "Delivery Right to Your Doorstep",
//       "desc":
//           "Sit back, and enjoy the convenience of our drivers delivering your order to your doorstep.",
//       "image": "assets/onboarding2.png",
//     },
//     {
//       "title": "Get Support From Our Skilled Team",
//       "desc":
//           "If our products don't meet your expectations, we're available 24/7 to assist you.",
//       "image": "assets/onboarding3.png",
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: BlocListener<OnboardingCubit, OnboardingState>(
//         listener: (context, state) {
//           if (state is OnboardingNavigateToLogin) {
//             Navigator.pushReplacementNamed(context, '/login');
//           }
//         },
//         child: BlocBuilder<OnboardingCubit, OnboardingState>(
//           builder: (context, state) {
//             return Column(
//               children: [
//                 Expanded(
//                   child: PageView.builder(
//                     controller: _pageController,
//                     onPageChanged: (index) =>
//                         context.read<OnboardingCubit>().updatePage(index),
//                     itemCount: onboardingData.length,
//                     itemBuilder: (context, index) {
//                       return Column(
//                         children: [
//                           ClipPath(
//                             clipper: HeaderClipper(),
//                             child: Image.asset(
//                               onboardingData[index]['image']!,
//                               height: MediaQuery.of(context).size.height * 0.55,
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                             ),
//                           ),

//                           const SizedBox(height: 10),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16),
//                             child: Text(
//                               onboardingData[index]['title']!,
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                 fontSize: 38,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF404040),
//                                 height: 1.1,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 16),
//                             child: Text(
//                               onboardingData[index]['desc']!,
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                 fontSize: 20,
//                                 color: Color(0xFF757575),
//                                 height: 1.2,
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                 ),

//                 _buildBottomControls(state.currentIndex),
//                 SizedBox(height: 80),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _buildBottomControls(int currentIndex) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           // SmoothPageIndicator(
//           //   controller: _pageController,
//           //   count: 3,
//           //   effect: const ExpandingDotsEffect(
//           //     activeDotColor: Color(0xFF156651),
//           //     dotColor: Color(0xFFD9D9D9),
//           //     dotHeight: 8,
//           //     dotWidth: 8,
//           //     expansionFactor: 2,
//           //   ),
//           // ),
//           SmoothPageIndicator(
//             controller: _pageController,
//             count: 3,
//             effect: SwapEffect(
//               activeDotColor: Color(0xFF156651),
//               dotColor: Color(0xFFD9D9D9),
//               dotHeight: 8,
//               dotWidth: 8,
//               spacing: 10,
//             ),
//           ),
//           const SizedBox(height: 40),
//           Row(
//             children: [
//               if (currentIndex > 0) ...[
//                 Expanded(
//                   child: TextButton(
//                     style: TextButton.styleFrom(
//                       foregroundColor: const Color(0xFF156651),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(
//                           12,
//                         ),
//                       ),
//                     ),
//                     onPressed: () => _pageController.previousPage(
//                       duration: const Duration(milliseconds: 300),
//                       curve: Curves.easeInOut,
//                     ),
//                     child: const Text(
//                       "Back",
//                       style: TextStyle(color: Color(0xFF156651), fontSize: 18),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(width: 25),
//               ],
//               // else
//               // const Spacer(),
//               // const SizedBox(width: 20),
//               Expanded(
//                 flex: 2,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (currentIndex < 2) {
//                       _pageController.nextPage(
//                         duration: const Duration(milliseconds: 300),
//                         curve: Curves.easeInOut,
//                       );
//                     } else {
//                       context.read<OnboardingCubit>().finishOnboarding(
//                         currentIndex,
//                       );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF156651),
//                     minimumSize: const Size(double.infinity, 48),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),

//                   child: Text(
//                     // currentIndex == 2 ? "Get Started" : "Next",
//                     "Next",
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// =================================================================

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Add this import
import 'package:home_haven/presentation/cubit/onboard/onboarding_cubit.dart';
import 'package:home_haven/presentation/cubit/onboard/onboarding_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'header_clipper.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // 1. Change to CarouselSliderController
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Online Home Store and Furniture",
      "desc":
          "Discover all style and budgets of furniture, appliances, kitchen, and more from 500+ brands in your hand.",
      "image": "assets/onboarding1.png",
    },
    {
      "title": "Delivery Right to Your Doorstep",
      "desc":
          "Sit back, and enjoy the convenience of our drivers delivering your order to your doorstep.",
      "image": "assets/onboarding2.png",
    },
    {
      "title": "Get Support From Our Skilled Team",
      "desc":
          "If our products don't meet your expectations, we're available 24/7 to assist you.",
      "image": "assets/onboarding3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          if (state is OnboardingNavigateToLogin) {
            Navigator.pushReplacementNamed(context, '/login');
          }
        },
        child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  // 2. Replace PageView with CarouselSlider
                  child: CarouselSlider.builder(
                    carouselController: _carouselController,
                    itemCount: onboardingData.length,
                    options: CarouselOptions(
                      height: double.infinity,
                      viewportFraction: 1.0, // Ensures full screen width
                      enableInfiniteScroll: false,
                      autoPlay: false,
                      onPageChanged: (index, reason) {
                        context.read<OnboardingCubit>().updatePage(index);
                      },
                    ),
                    itemBuilder: (context, index, realIndex) {
                      return Column(
                        children: [
                          ClipPath(
                            clipper: HeaderClipper(),
                            child: Image.asset(
                              onboardingData[index]['image']!,
                              height: MediaQuery.of(context).size.height * 0.55,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              onboardingData[index]['title']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 38,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF404040),
                                height: 1.1,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              onboardingData[index]['desc']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Color(0xFF757575),
                                height: 1.2,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                _buildBottomControls(state.currentIndex),
                const SizedBox(height: 80),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildBottomControls(int currentIndex) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // 3. SmoothPageIndicator works with AnimatedSmoothIndicator for Carousel
          AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: onboardingData.length,
            onDotClicked: (index) {
              _carouselController.animateToPage(index);
            },
            effect: const SwapEffect(
              activeDotColor: Color(0xFF156651),
              dotColor: Color(0xFFD9D9D9),
              dotHeight: 8,
              dotWidth: 8,
              spacing: 10,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              if (currentIndex > 0) ...[
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF156651),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => _carouselController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ),
                    child: const Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 25),
              ],
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    if (currentIndex < 2) {
                      _carouselController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      context.read<OnboardingCubit>().finishOnboarding(
                        currentIndex,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF156651),
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
