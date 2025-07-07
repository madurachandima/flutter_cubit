import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/common/widgets/movie/movie_card.dart';
import 'package:movie_app_cubit/presentation/watch/bloc/similar_movie_cubit.dart';
import 'package:movie_app_cubit/presentation/watch/bloc/similar_movie_state.dart';

class SimilarMovies extends StatelessWidget {
  final int movieId;

  const SimilarMovies({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarMovieCubit()..getSimilarMovieById(movieId),
      child: BlocBuilder<SimilarMovieCubit, SimilarMovieState>(
          builder: (context, state) {
        if (state is SimilarMovieLoading) {
          return const CircularProgressIndicator();
        }

        if (state is SimilarMovieLoaded) {
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

        if (state is SimilarMovieError) {
          return Text(state.errorMessage);
        }
        return Container();
      }),
    );
  }
}
