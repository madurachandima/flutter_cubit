import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/common/helper/applogger/app_logger.dart';
import 'package:movie_app_cubit/common/widgets/movie/movie_card.dart';
import 'package:movie_app_cubit/core/constants/api_url.dart';
import 'package:movie_app_cubit/presentation/home/bloc/now_playing_cubit.dart';
import 'package:movie_app_cubit/presentation/home/bloc/now_playing_state.dart';
import 'package:movie_app_cubit/presentation/home/bloc/treinding_state.dart';
import 'package:movie_app_cubit/presentation/home/bloc/trending_cubit.dart';
import 'package:movie_app_cubit/presentation/wach/bloc/recommended_movie_cubit.dart';
import 'package:movie_app_cubit/presentation/wach/bloc/recommended_movie_state.dart';

class RecommendedMovies extends StatelessWidget {
  final int movieId;

  const RecommendedMovies({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    Log.d("recommend movie id   movieId: $movieId");
    return BlocProvider(
      create: (context) =>
          RecommendedMovieCubit()..getRecommendedMovieById(movieId),
      child: BlocBuilder<RecommendedMovieCubit, RecommendedMovieState>(
          builder: (context, state) {
        if (state is RecommendedMovieLoading) {
          return const CircularProgressIndicator();
        }

        if (state is RecommendedMovieLoaded) {
          return SizedBox(
            height: 300,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return MovieCard(movieDataEntity: state.movies[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: state.movies.length),
          );
        }

        if (state is RecommendedMovieError) {
          return Text(state.errorMessage);
        }
        return Container();
      }),
    );
  }
}
