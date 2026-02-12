import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_haven/presentation/cubit/login/login_cubit.dart';
// import 'package:flutter/gestures.dart';
import '../../widgets/auth/header.dart';
import '../../widgets/auth/input_box.dart';
import '../../widgets/auth/button.dart';
import '../../widgets/auth/divider.dart';
import '../../widgets/auth/social_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F5F5),
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } 
            else if (state is LoginSuccess) {
            Navigator.pushReplacementNamed(context, '/main');
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsetsGeometry.fromSTEB(16, 0, 16, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),

                    const AuthHeader(
                      title: "Welcome Back!",
                      subtitle:
                          "Enter your email to start shopping and get awesome deals today!",
                    ),

                    const SizedBox(height: 32),

                    AuthTextField(
                      controller: emailController,
                      label: "Email",
                      hint: "rifqi.naufal@mail.com",
                      icon: Icons.email_outlined,
                    ),

                    const SizedBox(height: 16),

                    AuthTextField(
                      controller: passwordController,
                      label: "Password",
                      hint: "**********",
                      icon: Icons.lock_outline,
                      isPassword: true,
                    ),

                    const SizedBox(height: 24),

                    Text(
                      "Forgot your password?",
                      style: GoogleFonts.manrope(
                        color: const Color(0xFF156651),
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 24),

                    AuthButton(
                      text: "Log In",
                      onPressed: () {
                      
                        context.read<LoginCubit>().login(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            );
                      },
                    ),

                    const SizedBox(height: 24),

                    const DividerSection(), 

                    const SizedBox(height: 24),

                    const SocialButton(
                      label: "Log In with Google",
                      iconPath: "assets/google_icon.png",
                    ),
                    const SizedBox(height: 16),
                    const SocialButton(
                      label: "Log In with Facebook",
                      iconPath: "assets/facebook_icon.png",
                    ),

                    const SizedBox(height: 40),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, '/register'),
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              color: Color(0xFF156651),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Center(
                    //   child: RichText(
                    //     text: TextSpan(
                    //       // Set the size here ONCE for the whole sentence
                    //       style: GoogleFonts.manrope(
                    //         fontSize: 16,
                    //         color: const Color(0xFF757575),
                    //       ),
                    //       children: [
                    //         const TextSpan(text: "Don't have an account? "),
                    //         TextSpan(
                    //           text: "Register",
                    //           style: const TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             color: Color(0xFF156651),
                    //           ),
                    //           recognizer: TapGestureRecognizer()
                    //             ..onTap = () {
                    //               debugPrint("Register Clicked");
                    //             },
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),



    
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
