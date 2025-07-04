import 'package:movie_app_cubit/core/usecase/usecase.dart';
import 'package:movie_app_cubit/domain/auth/repositories/auth_repository.dart';
import 'package:movie_app_cubit/service_locator.dart';

class IsSignInUseCase extends UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}
