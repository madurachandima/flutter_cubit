import 'package:movie_app_cubit/core/network/net_result.dart';
import 'package:movie_app_cubit/data/auth/datasources/authentication/auth_api_service.dart';
import 'package:movie_app_cubit/data/auth/models/auth/signin_req_params.dart';
import 'package:movie_app_cubit/data/auth/models/auth/signup_req_params.dart';
import 'package:movie_app_cubit/domain/auth/repositories/auth_repository.dart';

import 'package:movie_app_cubit/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepoImpl extends AuthRepository {
  @override
  Future<Result> signup(SignUpRequestParams requestParams) async {
    Result result = await sl<AuthenticationService>().signUp(requestParams);
    if (result.exception == null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', result.result['token']);

      return result;
    }
    return result;
  }

  @override
  Future<Result> signIn(SignInRequestParams requestParams) async {
    Result result = await sl<AuthenticationService>().signIn(requestParams);
    if (result.exception == null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', result.result['token']);

      return result;
    }
    return result;
  }

  @override
  Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token != null;
  }
}
