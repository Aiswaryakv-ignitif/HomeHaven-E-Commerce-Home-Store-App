import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final String _correctEmail = "abc@gmail.com";
  final String _correctPassword = "123";

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      emit(LoginFailure("Fill all fields"));
      return;
    }

    if (email == _correctEmail && password == _correctPassword) {
      emit(LoginLoading());
      await Future.delayed(const Duration(seconds: 2));

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      emit(LoginSuccess());
    } else {
      emit(LoginFailure("Wrong credentials"));
    }
  }
}
