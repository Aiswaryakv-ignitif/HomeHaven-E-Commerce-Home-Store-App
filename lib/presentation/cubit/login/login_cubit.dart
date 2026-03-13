
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {

    // 1️⃣ Validate input
    if (email.trim().isEmpty || password.trim().isEmpty) {
      emit(LoginFailure("Please fill all fields"));
      return;
    }

    try {

      // 2️⃣ Emit loading state
      emit(LoginLoading());

      // 3️⃣ Firebase login request
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
      // 4️⃣ Login success
      emit(LoginSuccess());

    } on FirebaseAuthException catch (e) {

      // 5️⃣ Handle Firebase errors
      String message;

      switch (e.code) {
        case "user-not-found":
          message = "User not found";
          break;

        case "wrong-password":
          message = "Incorrect password";
          break;

        case "invalid-email":
          message = "Invalid email";
          break;

        case "invalid-credential":
          message = "Incorrect password ";
          break;

        case "network-request-failed":
          message = "No internet connection";
          break;

        default:
          message = "Login failed";
      }

      emit(LoginFailure(message));

    } catch (e) {

      // 6️⃣ Any other error
      emit(LoginFailure("Something went wrong"));
    }
  }
}

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// part 'login_state.dart';


// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit() : super(LoginInitial());
//   final String _correctEmail = "abc@gmail.com";
//   final String _correctPassword = "123";
//   Future<void> login(String email, String password) async {
//     if (email.isEmpty || password.isEmpty) {
//       emit(LoginFailure("Fill all fields"));
//       return;
//     }

//     if (email == _correctEmail && password == _correctPassword) {
//       emit(LoginLoading());
//       await Future.delayed(const Duration(seconds: 2));

//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setBool('isLoggedIn', true);

//       emit(LoginSuccess());
//     } else {
//       emit(LoginFailure("Wrong credentials"));
//     }
//   }
// }




