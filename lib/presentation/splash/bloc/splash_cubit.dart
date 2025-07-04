import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/domain/auth/repositories/auth_repository.dart';
import 'package:movie_app_cubit/presentation/splash/bloc/splash_state.dart';
import 'package:movie_app_cubit/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  // pass the initial state in this case it is a DisplaySplash
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    var isLoggedIn = await sl<AuthRepository>().isLoggedIn();

    // skipped auth part because auth API not worked
    // if (isLoggedIn) {
    //   emit(Authenticated());
    // } else {
    //   emit(UnAuthenticated());
    // }

    emit(Authenticated());
  }
}
