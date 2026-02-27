import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingPageChanged(0));

  // Updates the dots and text
  void updatePage(int index) {
    emit(OnboardingPageChanged(index));
  }

  // Triggers the navigation logic
  void finishOnboarding(int index) {
    emit(OnboardingNavigateToLogin(index));
  }
}