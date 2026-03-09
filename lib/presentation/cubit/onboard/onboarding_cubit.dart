import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingPageChanged(0));

  // Updates the dots and text
  void updatePage(int index) {
    emit(OnboardingPageChanged(index));
  }

  // Triggers the navigation logic
  Future<void> finishOnboarding(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isOnboardingSeen', true);

    emit(OnboardingNavigateToLogin(index));
  }
}
