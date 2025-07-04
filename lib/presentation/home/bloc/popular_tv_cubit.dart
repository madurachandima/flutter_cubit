import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/domain/tv/entity/tv.dart';
import 'package:movie_app_cubit/domain/tv/usecases/get_popular_tvs_hows.dart';
import 'package:movie_app_cubit/presentation/home/bloc/popular_tv_state.dart';
import 'package:movie_app_cubit/service_locator.dart';

class PopularTvCubit extends Cubit<PopularTvState> {
  PopularTvCubit() : super(PopularTvLoading());

  void getPopularTv() async {
    var result = await sl<GetPopularTvShowsUseCase>().call();
    if (result.exception != null) {
      emit(PopularTvError(errorMessage: "Something went wrong"));
    } else {
      TvEntity tvEntity = result.result;
      List<TvDataEntity> tvShows = tvEntity.results ?? [];
      emit(PopularTvLoaded(tvShows: tvShows));
    }
  }
}
