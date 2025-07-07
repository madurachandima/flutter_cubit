import 'package:movie_app_cubit/domain/movie/entities/movie.dart';

abstract class SimilarMovieState {}

class SimilarMovieLoading extends SimilarMovieState {}

class SimilarMovieLoaded extends SimilarMovieState {
  final List<MovieDataEntity> movies;

  SimilarMovieLoaded({required this.movies});
}

class SimilarMovieError extends SimilarMovieState {
  final String errorMessage;

  SimilarMovieError({required this.errorMessage});
}