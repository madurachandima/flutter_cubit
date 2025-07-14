import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/domain/movie/entities/movie.dart';
import 'package:movie_app_cubit/domain/movie/usecases/search_movie.dart';
import 'package:movie_app_cubit/domain/tv/entity/tv.dart';
import 'package:movie_app_cubit/domain/tv/usecases/search_tv.dart';
import 'package:movie_app_cubit/presentation/search/cubit/search_state.dart';
import 'package:movie_app_cubit/presentation/search/cubit/selectable_option_cubit.dart';
import 'package:movie_app_cubit/service_locator.dart';

class SearchCubit extends Cubit<SearchState> {
  TextEditingController searchController = TextEditingController();

  List<MovieDataEntity> movies = [];
  int moviePage = 2;
  bool haseMovieNextPage = false;

  List<TvDataEntity> tvs = [];
  int tvPage = 2;
  bool haseTvNextPage = false;

  SearchCubit() : super(SearchInitialState());

  void search({required String query, required SearchType type, int? page}) {
    if (page == null) {
      emit(SearchLoadingState());
    } else {
      emit(SearchPaginationLoadingState());
    }

    switch (type) {
      case SearchType.movie:
        _searchMovies(query, page);
        break;
      case SearchType.tv:
        _searchTvs(query, page);
        break;
    }
  }

  void _searchMovies(String query, int? page) async {
    if (query.isEmpty) {
      movies = [];
      emit(MoviesLoaded(movies: movies));
      return;
    }
    var response = await sl<SearchMovieUseCase>().call(
      params: query,
      page: page,
    );

    if (response.exception != null) {
      emit(SearchErrorState(message: "Something went wrong"));
    } else {
      MovieEntity movieEntity = response.result;

      if (page == null) {
        movies = movieEntity.results ?? [];
        if (movieEntity.totalPages != null &&
            movieEntity.totalPages! > moviePage) {
          haseMovieNextPage = true;
        } else {
          haseMovieNextPage = false;
        }
      } else if (movieEntity.results != null &&
          movieEntity.results!.isNotEmpty) {
        movies.addAll(movieEntity.results!);
        if (movieEntity.totalPages != null &&
            movieEntity.totalPages! > moviePage) {
          haseMovieNextPage = true;
        } else {
          haseMovieNextPage = false;
        }

        moviePage = moviePage + 1;
      }

      emit(MoviesLoaded(movies: movies));
    }
  }

  void _searchTvs(String query, int? page) async {
    if (query.isEmpty) {
      tvs = [];
      emit(TvLoaded(tvs: tvs));
      return;
    }
    var response =
        await sl<SearchTvShowsUseCase>().call(params: query, page: page);

    if (response.exception != null) {
      emit(SearchErrorState(message: "Something went wrong"));
    } else {
      TvEntity tvEntity = response.result;

      if (page == null) {
        tvs = tvEntity.results ?? [];
        if (tvEntity.totalPages != null && tvEntity.totalPages! > tvPage) {
          haseTvNextPage = true;
        } else {
          haseTvNextPage = false;
        }
      } else if (tvEntity.results != null && tvEntity.results!.isNotEmpty) {
        tvs.addAll(tvEntity.results!);
        if (tvEntity.totalPages != null && tvEntity.totalPages! > tvPage) {
          haseTvNextPage = true;
        } else {
          haseTvNextPage = false;
        }

        tvPage = tvPage + 1;
      }

      emit(TvLoaded(tvs: tvs));
    }
  }
}
