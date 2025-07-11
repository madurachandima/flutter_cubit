import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class TrailerState {}

class TrailerLoading extends TrailerState {}

class TrailerLoaded<T> extends TrailerState {
  final YoutubePlayerController controller;
  final T trailers;

  TrailerLoaded({required this.controller, required this.trailers});
}

class TrailerError extends TrailerState {
  final String errorMessage;

  TrailerError({required this.errorMessage});
}
