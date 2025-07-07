import 'package:movie_app_cubit/domain/movie/entities/movie.dart';

abstract class RecommendedMovieState {}

class RecommendedMovieLoading extends RecommendedMovieState {}

class RecommendedMovieLoaded extends RecommendedMovieState {
  final List<MovieDataEntity> movies;

  RecommendedMovieLoaded({required this.movies});
}

class RecommendedMovieError extends RecommendedMovieState {
  final String errorMessage;

  RecommendedMovieError({required this.errorMessage});
}
