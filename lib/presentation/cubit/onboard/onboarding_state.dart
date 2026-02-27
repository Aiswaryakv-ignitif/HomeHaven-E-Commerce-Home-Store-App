abstract class OnboardingState {
  final int currentIndex;
  OnboardingState(this.currentIndex);
}

// Used for normal swiping
class OnboardingPageChanged extends OnboardingState {
  OnboardingPageChanged(int index) : super(index);
}

// Used ONLY when it's time to navigate to Login
class OnboardingNavigateToLogin extends OnboardingState {
  OnboardingNavigateToLogin(int index) : super(index); // We are on the last page
}