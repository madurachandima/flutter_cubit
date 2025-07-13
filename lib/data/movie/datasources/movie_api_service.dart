import 'package:dio/dio.dart';
import 'package:movie_app_cubit/common/helper/applogger/app_logger.dart';
import 'package:movie_app_cubit/core/constants/api_url.dart';
import 'package:movie_app_cubit/core/network/dio_client.dart';
import 'package:movie_app_cubit/core/network/net_exception.dart';
import 'package:movie_app_cubit/core/network/net_result.dart';
import 'package:movie_app_cubit/service_locator.dart';

abstract class MovieService {
  Future<Result> getTrendingMovies();

  Future<Result> nowPlayingMovies();

  Future<Result> getMovieTrailerById(int id);

  Future<Result> getRecommendedMoviesById(int id);

  Future<Result> getSimilarMoviesById(int id);

  Future<Result> getKeyWordsById(int id);
}

class MovieApiServiceImpl extends MovieService {
  @override
  Future<Result> getTrendingMovies() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.trendingMovies,
      );
      return Result(result: response.data);
    } on DioException catch (e) {
      Log.e(e.toString());
      return Result(
          exception: NetException(
        message: e.message,
        code: e.response?.statusCode,
      ));
    }
  }

  @override
  Future<Result> nowPlayingMovies() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.nowPlayingMovies,
      );
      return Result(result: response.data);
    } on DioException catch (e) {
      Log.e(e.toString());
      return Result(
          exception: NetException(
        message: e.message,
        code: e.response?.statusCode,
      ));
    }
  }

  @override
  Future<Result> getMovieTrailerById(int id) async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.getMovieTrailerById.replaceAll("{movie_id}", id.toString()),
      );
      return Result(result: response.data);
    } on DioException catch (e) {
      Log.e(e.toString());
      return Result(
          exception: NetException(
        message: e.message,
        code: e.response?.statusCode,
      ));
    }
  }

  @override
  Future<Result> getRecommendedMoviesById(int id) async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.getRecommendedMoviesById.replaceAll("{movie_id}", id.toString()),
      );
      return Result(result: response.data);
    } on DioException catch (e) {
      Log.e(e.toString());
      return Result(
          exception: NetException(
        message: e.message,
        code: e.response?.statusCode,
      ));
    }
  }

  @override
  Future<Result> getSimilarMoviesById(int id) async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.getSimilarMoviesById.replaceAll("{movie_id}", id.toString()),
      );
      return Result(result: response.data);
    } on DioException catch (e) {
      Log.e(e.toString());
      return Result(
          exception: NetException(
        message: e.message,
        code: e.response?.statusCode,
      ));
    }
  }

  @override
  Future<Result> getKeyWordsById(int id) async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.getMovieKeyWordById.replaceAll("{movie_id}", id.toString()),
      );
      return Result(result: response.data);
    } on DioException catch (e) {
      Log.e(e.toString());
      return Result(
          exception: NetException(
        message: e.message,
        code: e.response?.statusCode,
      ));
    }
  }
}
