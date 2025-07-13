import 'package:movie_app_cubit/core/network/net_result.dart';

abstract class MovieRepository {
  Future<Result> getTrendingMovies();

  Future<Result> nowPlayingMovies();

  Future<Result> getMovieTrailerById(int id);

  Future<Result> getRecommendedMoviesById(int id);

  Future<Result> getSimilarMoviesById(int id);

  Future<Result> getKeyWordsById(int id);
}
