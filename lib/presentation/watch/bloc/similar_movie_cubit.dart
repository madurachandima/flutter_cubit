import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/domain/movie/entities/movie.dart';
import 'package:movie_app_cubit/domain/movie/usecases/get_similar_movie_by_id.dart';
import 'package:movie_app_cubit/presentation/watch/bloc/similar_movie_state.dart';
import 'package:movie_app_cubit/service_locator.dart';

class SimilarMovieCubit extends Cubit<SimilarMovieState> {
  SimilarMovieCubit() : super(SimilarMovieLoading());

  void getSimilarMovieById(int movieId) async {
    var result = await sl<GetSimilarMovieByIdUseCase>().call(params: movieId);
    if (result.exception != null) {
      emit(SimilarMovieError(errorMessage: "Something went wrong"));
    } else {
      MovieEntity movieEntity = result.result;
      List<MovieDataEntity> movies = movieEntity.results ?? [];
      emit(SimilarMovieLoaded(movies: movies));
    }
  }
}
