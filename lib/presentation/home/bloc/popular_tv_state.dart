import 'package:movie_app_cubit/domain/tv/entity/tv.dart';

abstract class PopularTvState {}

class PopularTvLoading extends PopularTvState {}

class PopularTvLoaded extends PopularTvState {
  final List<TvDataEntity> tvShows;

  PopularTvLoaded({required this.tvShows});
}

class PopularTvError extends PopularTvState {
  final String errorMessage;

  PopularTvError({required this.errorMessage});
}
