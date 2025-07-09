import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/common/bloc/generic_data_cubit.dart';
import 'package:movie_app_cubit/common/bloc/generic_data_state.dart';
import 'package:movie_app_cubit/common/widgets/movie/movie_card.dart';
import 'package:movie_app_cubit/domain/movie/entities/movie.dart';
import 'package:movie_app_cubit/domain/movie/usecases/get_similar_movie_by_id.dart';
import 'package:movie_app_cubit/service_locator.dart';

class SimilarMovies extends StatelessWidget {
  final int movieId;

  const SimilarMovies({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<MovieDataEntity>>(sl<GetSimilarMovieByIdUseCase>(),
            params: movieId),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
          builder: (context, state) {
        if (state is DataLoading) {
          return const CircularProgressIndicator();
        }

        if (state is DataLoaded) {
          return SizedBox(
            height: 300,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return MovieCard(movieDataEntity: state.data[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: state.data.length),
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
