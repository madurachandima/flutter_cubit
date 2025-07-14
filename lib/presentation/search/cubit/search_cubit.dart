import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/domain/movie/usecases/search_movie.dart';
import 'package:movie_app_cubit/domain/tv/repositories/tv_repository.dart';
import 'package:movie_app_cubit/presentation/search/cubit/search_state.dart';
import 'package:movie_app_cubit/presentation/search/cubit/selectable_option_cubit.dart';
import 'package:movie_app_cubit/service_locator.dart';

class SearchCubit extends Cubit<SearchState> {
  TextEditingController searchController = TextEditingController();

  SearchCubit() : super(SearchInitialState());

  void search({required String query, required SearchType type}) {
    emit(SearchLoadingState());

    switch (type) {
      case SearchType.movie:
        _searchMovies(query);
        break;
      case SearchType.tv:
        _searchTvs(query);
        break;
    }
  }

  void _searchMovies(String query) async {
    if (query.isEmpty) return;

    var response = await sl<SearchMovieUseCase>().call(params: query);
    if (response.exception != null) {
      emit(SearchErrorState(message: "Something went wrong"));
    } else {
      var data = response.result.results ?? [];
      emit(MoviesLoaded(movies: data));
    }
  }

  void _searchTvs(String query) async {
    var response = await sl<TvRepository>().searchTv(query);
    if (response.exception != null) {
      emit(SearchErrorState(message: "Something went wrong"));
    } else {
      var data = response.result.results ?? [];
      emit(TvLoaded(tvs: data));
    }
  }
}
