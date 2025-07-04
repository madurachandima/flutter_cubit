import 'package:movie_app_cubit/common/helper/applogger/app_logger.dart';
import 'package:movie_app_cubit/common/helper/moviemapper/MovieMapper.dart';
import 'package:movie_app_cubit/common/helper/moviemapper/MovieTrailerMapper.dart';
import 'package:movie_app_cubit/core/network/net_result.dart';
import 'package:movie_app_cubit/data/movie/datasources/movie_api_service.dart';
import 'package:movie_app_cubit/data/movie/models/movie/movie_model.dart';
import 'package:movie_app_cubit/data/movie/models/movie/movie_trailer_model.dart';
import 'package:movie_app_cubit/domain/movie/repositories/movie_repository.dart';
import 'package:movie_app_cubit/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Result> getTrendingMovies() async {
    try {
      Result result = await sl<MovieService>().getTrendingMovies();
      if (result.exception != null) {
        return result;
      }
      result.result = MovieMapper.toEntity(MovieModel.fromJson(result.result));
      return result;
    } catch (e) {
      Log.e(e.toString());
      rethrow;
    }
  }

  @override
  Future<Result> nowPlayingMovies() async {
    try {
      Result result = await sl<MovieService>().nowPlayingMovies();
      if (result.exception != null) {
        return result;
      }
      result.result = MovieMapper.toEntity(MovieModel.fromJson(result.result));
      return result;
    } catch (e) {
      Log.e(e.toString());
      rethrow;
    }
  }

  @override
  Future<Result> getMovieTrailerById(int id) async {
    try {
      Result result = await sl<MovieService>().getMovieTrailerById(id);
      if (result.exception != null) {
        return result;
      }
      result.result = MovieTrailerMapper.toEntity(
          MovieTrailerModel.fromJson(result.result));
      return result;
    } catch (e) {
      Log.e(e.toString());
      rethrow;
    }
  }
}
