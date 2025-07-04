import 'package:movie_app_cubit/domain/movie/entities/movie_trailer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class TrailerState {}

class TrailerLoading extends TrailerState {}

class TrailerLoaded extends TrailerState {
  final YoutubePlayerController controller;
  final List<MovieTrailerDataEntity> movieTrailers;

  TrailerLoaded({required this.controller, required this.movieTrailers});
}

class TrailerError extends TrailerState {
  final String errorMessage;

  TrailerError({required this.errorMessage});
}
