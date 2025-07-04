import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_cubit/common/helper/message/display_message.dart';
import 'package:movie_app_cubit/common/helper/navigation/app_navigation.dart';
import 'package:movie_app_cubit/data/auth/models/auth/signin_req_params.dart';
import 'package:movie_app_cubit/domain/auth/usecases/signin.dart';
import 'package:movie_app_cubit/presentation/home/pages/home.dart';
import 'package:movie_app_cubit/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

import '../../../core/config/theme/app_colors.dart';
import 'sign_up.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

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
            _signInText(),
            const SizedBox(height: 30),
            _emailField(),
            const SizedBox(height: 30),
            _passwordField(),
            const SizedBox(height: 30),
            _signInButton(context),
            const SizedBox(height: 30),
            _signUpText(context)
          ],
        ),
      ),
    );
  }

  Widget _signInText() {
    return const Text(
      "Sign In",
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

  Widget _signInButton(BuildContext context) {
    return ReactiveButton(
      title: "Sign In",
      activeColor: AppColors.primary,
      onPressed: () async {
        sl<SignInUseCase>().call(
          params: SignInRequestParams(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        );
      },
      onSuccess: () {
        AppNavigator.pushAndRemove(context, const HomePage());
      },
      onFailure: (error) {
        DisplayMessage.errorMessage(error, context);
      },
    );
  }

  Widget _signUpText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      const TextSpan(text: "Don't have an account? "),
      TextSpan(
          text: "Sgn Up",
          style: const TextStyle(
            color: Colors.blue,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, SignUpPage());
            })
    ]));
  }
}
