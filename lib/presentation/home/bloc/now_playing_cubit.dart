import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/domain/movie/entities/movie.dart';
import 'package:movie_app_cubit/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:movie_app_cubit/presentation/home/bloc/now_playing_state.dart';
import 'package:movie_app_cubit/service_locator.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingMoviesLoading());

  void getNowPlayingMovies() async {
    var result = await sl<GetNowPlayingMoviesUseCase>().call();
    if (result.exception != null) {
      emit(NowPlayingMoviesError(errorMessage: "Something went wrong"));
    } else {
      MovieEntity movieEntity = result.result;
      List<MovieDataEntity> movies = movieEntity.results ?? [];
      emit(NowPlayingMoviesLoaded(movies: movies));
    }
  }
}
