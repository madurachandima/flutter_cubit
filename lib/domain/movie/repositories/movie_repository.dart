import 'package:movie_app_cubit/core/network/net_result.dart';

abstract class MovieRepository{
  Future<Result> getTrendingMovies();

  Future<Result> nowPlayingMovies();

  Future<Result> getMovieTrailerById(int id);


}