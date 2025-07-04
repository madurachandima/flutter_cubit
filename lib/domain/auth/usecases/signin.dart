import 'package:movie_app_cubit/core/network/net_result.dart';
import 'package:movie_app_cubit/core/usecase/usecase.dart';
import 'package:movie_app_cubit/data/auth/models/auth/signin_req_params.dart';
import 'package:movie_app_cubit/domain/auth/repositories/auth_repository.dart';
import 'package:movie_app_cubit/service_locator.dart';

class SignInUseCase extends UseCase<Result, SignInRequestParams> {
@override
Future<Result> call({SignInRequestParams? params}) async {
  if (params == null) {
    throw Exception("User name and password required");
  }
  if (params.email.isEmpty) {
    throw Exception("Email required");
  }
  if (params.password.isEmpty) {
    throw Exception("Password required");
  }

  return await sl<AuthRepository>().signIn(params);
}
}