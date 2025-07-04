import 'package:movie_app_cubit/domain/movie/entities/movie.dart';

abstract class TrendingState {}

class TrendingMoviesLoading extends TrendingState {}

class TrendingMoviesLoaded extends TrendingState {
  final List<MovieDataEntity> movies;

  TrendingMoviesLoaded({required this.movies});
}

class TrendingMoviesError extends TrendingState {
  final String errorMessage;
  TrendingMoviesError({required this.errorMessage});
}
