import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_cubit/common/helper/message/display_message.dart';
import 'package:movie_app_cubit/data/auth/models/auth/signup_req_params.dart';
import 'package:movie_app_cubit/domain/auth/usecases/signup.dart';
import 'package:movie_app_cubit/presentation/authentication/pages/sign_in.dart';
import 'package:movie_app_cubit/presentation/home/pages/home.dart';
import 'package:movie_app_cubit/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

import '../../../common/helper/navigation/app_navigation.dart';
import '../../../core/config/theme/app_colors.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _signUpText(),
            const SizedBox(height: 30),
            _emailField(),
            const SizedBox(height: 30),
            _passwordField(),
            const SizedBox(height: 30),
            _signUpButton(context),
            const SizedBox(height: 30),
            _signInText(context)
          ],
        ),
      ),
    );
  }

  Widget _signUpText() {
    return const Text(
      "Sign Up",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(hintText: "Email"),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordController,
      decoration: const InputDecoration(hintText: "Password"),
    );
  }

  Widget _signUpButton(BuildContext context) {
    return ReactiveButton(
      title: "Sign Up",
      activeColor: AppColors.primary,
      onPressed: () async {
        await sl<SignUpUseCase>().call(
            params: SignUpRequestParams(
                email: _emailController.text,
                password: _passwordController.text));
      },
      onSuccess: () {
        AppNavigator.pushAndRemove(context, const HomePage());
      },
      onFailure: (error) {
        DisplayMessage.errorMessage(error, context);
      },
    );
  }

  Widget _signInText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      const TextSpan(text: "Already have an account? "),
      TextSpan(
          text: "Sgn In",
          style: const TextStyle(
            color: Colors.blue,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, SignInPage());
            })
    ]));
  }
}
