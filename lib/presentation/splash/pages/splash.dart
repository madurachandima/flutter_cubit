import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/common/helper/navigation/app_navigation.dart';
import 'package:movie_app_cubit/core/config/assets/app_images.dart';
import 'package:movie_app_cubit/presentation/authentication/pages/sign_in.dart';
import 'package:movie_app_cubit/presentation/home/pages/home.dart';

import '../bloc/splash_cubit.dart';
import '../bloc/splash_state.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (BuildContext context, SplashState state) {
          if (state is UnAuthenticated) {
            AppNavigator.pushReplacement(context, SignInPage());
          }
          if (state is Authenticated) {
            AppNavigator.pushReplacement(context, const HomePage());
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.splashBackground))),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                    const Color(0xff1a1b20).withOpacity(0),
                    const Color(0xff1a1b20)
                  ])),
            )
          ],
        ),
      ),
    );
  }
}
