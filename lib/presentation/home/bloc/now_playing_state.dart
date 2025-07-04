import 'package:movie_app_cubit/domain/movie/entities/movie.dart';

abstract class NowPlayingState {}

class NowPlayingMoviesLoading extends NowPlayingState {}

class NowPlayingMoviesLoaded extends NowPlayingState {
  final List<MovieDataEntity> movies;

  NowPlayingMoviesLoaded({required this.movies});
}

class NowPlayingMoviesError extends NowPlayingState {
  final String errorMessage;

  NowPlayingMoviesError({required this.errorMessage});
}
