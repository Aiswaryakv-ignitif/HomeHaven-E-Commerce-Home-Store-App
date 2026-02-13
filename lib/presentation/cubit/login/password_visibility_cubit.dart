import 'package:flutter_bloc/flutter_bloc.dart';
part 'password_visibility_state.dart';

class PasswordVisibilityCubit extends Cubit<PasswordVisibilityState> {
  // Initial state is true (password is hidden by dots)
  PasswordVisibilityCubit() : super(PasswordVisibilityState(isObscured: true));

  void toggleVisibility() {
    emit(PasswordVisibilityState(isObscured: !state.isObscured));
  }
}