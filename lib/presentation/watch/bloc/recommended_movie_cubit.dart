import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/domain/movie/entities/movie.dart';
import 'package:movie_app_cubit/domain/movie/usecases/get_recommended_movie_by_id.dart';
import 'package:movie_app_cubit/presentation/watch/bloc/recommended_movie_state.dart';
import 'package:movie_app_cubit/service_locator.dart';

class RecommendedMovieCubit extends Cubit<RecommendedMovieState> {
  RecommendedMovieCubit() : super(RecommendedMovieLoading());

  void getRecommendedMovieById(int movieId) async {
    var result =
        await sl<GetRecommendedMovieByIdUseCase>().call(params: movieId);
    if (result.exception != null) {
      emit(RecommendedMovieError(errorMessage: "Something went wrong"));
    } else {
      MovieEntity movieEntity = result.result;
      List<MovieDataEntity> movies = movieEntity.results ?? [];
      emit(RecommendedMovieLoaded(movies: movies));
    }
  }
}
