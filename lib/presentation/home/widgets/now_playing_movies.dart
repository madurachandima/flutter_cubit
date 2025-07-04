import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/common/widgets/movie/movie_card.dart';
import 'package:movie_app_cubit/core/constants/api_url.dart';
import 'package:movie_app_cubit/presentation/home/bloc/now_playing_cubit.dart';
import 'package:movie_app_cubit/presentation/home/bloc/now_playing_state.dart';
import 'package:movie_app_cubit/presentation/home/bloc/treinding_state.dart';
import 'package:movie_app_cubit/presentation/home/bloc/trending_cubit.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NowPlayingCubit()..getNowPlayingMovies(),
      child: BlocBuilder<NowPlayingCubit, NowPlayingState>(
          builder: (context, state) {
        if (state is TrendingMoviesLoading) {
          return const CircularProgressIndicator();
        }

        if (state is NowPlayingMoviesLoaded) {
          return SizedBox(
            height: 300,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding:const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return MovieCard(movieDataEntity: state.movies[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: state.movies.length),
          );
        }

        if (state is NowPlayingMoviesError) {
          return Text(state.errorMessage);
        }
        return Container();
      }),
    );
  }
}
