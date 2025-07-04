import 'package:movie_app_cubit/core/network/net_result.dart';
import 'package:movie_app_cubit/core/usecase/usecase.dart';
import 'package:movie_app_cubit/data/auth/models/auth/signup_req_params.dart';
import 'package:movie_app_cubit/domain/auth/repositories/auth_repository.dart';
import 'package:movie_app_cubit/service_locator.dart';

class SignUpUseCase extends UseCase<Result, SignUpRequestParams> {
  @override
  Future<Result> call({SignUpRequestParams? params}) async {
    if (params == null) {
      throw Exception("User name and password required");
    }
    if (params.email.isEmpty) {
      throw Exception("Email required");
    }
    if (params.password.isEmpty) {
      throw Exception("Password required");
    }

    return await sl<AuthRepository>().signup(params);
  }
}
