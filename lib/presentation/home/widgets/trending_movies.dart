import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/core/constants/api_url.dart';
import 'package:movie_app_cubit/domain/movie/entities/movie.dart';
import 'package:movie_app_cubit/presentation/home/bloc/treinding_state.dart';
import 'package:movie_app_cubit/presentation/home/bloc/trending_cubit.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingCubit()..getTrendingMovies(),
      child:
          BlocBuilder<TrendingCubit, TrendingState>(builder: (context, state) {
        if (state is TrendingMoviesLoading) {
          return const CircularProgressIndicator();
        }

        if (state is TrendingMoviesLoaded) {
          return FanCarouselImageSlider.sliderType2(
            imagesLink: state.movies
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

        if (state is TrendingMoviesError) {
          return Text(state.errorMessage);
        }
        return Container();
      }),
    );
  }
}
