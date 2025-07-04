import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/domain/movie/entities/movie.dart';
import 'package:movie_app_cubit/domain/movie/usecases/get_trending_movies.dart';
import 'package:movie_app_cubit/presentation/home/bloc/treinding_state.dart';
import 'package:movie_app_cubit/service_locator.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async {
    var result = await sl<GetTrendingMoviesUseCase>().call();
    if (result.exception != null) {
      emit(TrendingMoviesError(errorMessage: "Something went wrong"));
    } else {
      MovieEntity movieEntity = result.result;
      List<MovieDataEntity> movies = movieEntity.results ?? [];
      emit(TrendingMoviesLoaded(movies: movies));
    }
  }
}
