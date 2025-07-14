import 'package:movie_app_cubit/domain/movie/entities/movie.dart';
import 'package:movie_app_cubit/domain/tv/entity/tv.dart';

abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class MoviesLoaded extends SearchState {
  final List<MovieDataEntity> movies;

  MoviesLoaded({required this.movies});
}

class TvLoaded extends SearchState {
  final List<TvDataEntity> tvs;

  TvLoaded({required this.tvs});
}

class SearchErrorState extends SearchState {
  final String message;

  SearchErrorState({required this.message});
}
