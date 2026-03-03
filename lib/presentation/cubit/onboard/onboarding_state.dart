abstract class OnboardingState {
  final int currentIndex;
  OnboardingState(this.currentIndex);
}

// Used for normal swiping
class OnboardingPageChanged extends OnboardingState {
  OnboardingPageChanged(super.index);
}

// Used ONLY when it's time to navigate to Login
class OnboardingNavigateToLogin extends OnboardingState {
  OnboardingNavigateToLogin(super.index); 
}