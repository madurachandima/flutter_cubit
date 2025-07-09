import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/common/bloc/generic_data_cubit.dart';
import 'package:movie_app_cubit/common/bloc/generic_data_state.dart';
import 'package:movie_app_cubit/domain/movie/entities/movie.dart';
import 'package:movie_app_cubit/domain/movie/usecases/get_trending_movies.dart';
import 'package:movie_app_cubit/service_locator.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<MovieDataEntity>>(sl<GetTrendingMoviesUseCase>()),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
          builder: (context, state) {
        if (state is DataLoading) {
          return const CircularProgressIndicator();
        }

        if (state is DataLoaded) {
          List<MovieDataEntity> movies = state.data;
          return FanCarouselImageSlider.sliderType2(
            imagesLink: movies
                .map(
                  (MovieDataEntity e) => e.providePosterPath(),
                )
                .toList(),
            isAssets: false,
            autoPlay: false,
            sliderHeight: 400,
            imageFitMode: BoxFit.fill,
            isClickable: true,
          );
        }

        if (state is DataError) {
          return Text(state.errorMessage);
        }
        return Container();
      }),
    );
  }
}
