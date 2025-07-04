import 'package:movie_app_cubit/core/network/net_result.dart';
import 'package:movie_app_cubit/data/auth/models/auth/signin_req_params.dart';
import 'package:movie_app_cubit/data/auth/models/auth/signup_req_params.dart';

abstract class AuthRepository {
  Future<Result> signup(SignUpRequestParams requestParams);

  Future<Result> signIn(SignInRequestParams requestParams);

  Future<bool> isLoggedIn();
}
