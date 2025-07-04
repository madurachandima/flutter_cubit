import 'package:dio/dio.dart';
import 'package:movie_app_cubit/core/constants/api_url.dart';
import 'package:movie_app_cubit/core/network/dio_client.dart';
import 'package:movie_app_cubit/core/network/net_exception.dart';
import 'package:movie_app_cubit/core/network/net_result.dart';
import 'package:movie_app_cubit/data/auth/models/auth/signin_req_params.dart';
import 'package:movie_app_cubit/data/auth/models/auth/signup_req_params.dart';
import 'package:movie_app_cubit/service_locator.dart';

abstract class AuthenticationService {
  Future<Result> signUp(SignUpRequestParams requestParams);

  Future<Result> signIn(SignInRequestParams requestParams);
}

class AuthenticationApiServiceImpl extends AuthenticationService {
  @override
  Future<Result> signUp(SignUpRequestParams requestParams) async {
    try {
      var response = await sl<DioClient>()
          .post(ApiUrl.signup, data: requestParams.toJson());
      return Result(result: response.data);
    } on DioException catch (e) {
      return Result(
          exception: NetException(
        message: e.message,
        code: e.response?.statusCode,
      ));
    }
  }

  @override
  Future<Result> signIn(SignInRequestParams requestParams) async {
    try {
      var response = await sl<DioClient>()
          .post(ApiUrl.signin, data: requestParams.toJson());
      return Result(result: response.data);
    } on DioException catch (e) {
      return Result(
          exception: NetException(
        message: e.message,
        code: e.response?.statusCode,
      ));
    }
  }
}
