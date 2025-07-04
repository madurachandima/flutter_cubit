import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/core/config/theme/app_theme.dart';
import 'package:movie_app_cubit/presentation/splash/pages/splash.dart';

import 'presentation/splash/bloc/splash_cubit.dart';
import 'service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movie App',
          theme: AppTheme.appTheme,
          home: const Splash()),
    );
  }
}
