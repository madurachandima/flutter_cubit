import 'package:flutter/material.dart';
import 'package:movie_app_cubit/common/widgets/appbar/app_bar.dart';
import 'package:movie_app_cubit/core/entity/trailer_entity.dart';
import 'package:movie_app_cubit/domain/movie/entities/movie.dart';
import 'package:movie_app_cubit/domain/movie/usecases/get_movie_trailer_by_id.dart';
import 'package:movie_app_cubit/presentation/home/widgets/category_text.dart';
import 'package:movie_app_cubit/presentation/watch/widgets/recommended_movies.dart';
import 'package:movie_app_cubit/presentation/watch/widgets/similar_movies.dart';
import 'package:movie_app_cubit/presentation/watch/widgets/vdeo_player.dart';
import 'package:movie_app_cubit/presentation/watch/widgets/vide_vote_avg.dart';
import 'package:movie_app_cubit/presentation/watch/widgets/video_overview.dart';
import 'package:movie_app_cubit/presentation/watch/widgets/video_release_date.dart';
import 'package:movie_app_cubit/presentation/watch/widgets/video_title.dart';
import 'package:movie_app_cubit/service_locator.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieDataEntity movieDataEntity;

  const MovieWatchPage({super.key, required this.movieDataEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppbar(
          hideBack: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              movieDataEntity.id == null
                  ? const Center(
                      child: Text("Movie id not found!"),
                    )
                  : VideoPlayer<List<TrailerDataEntity>>(
                      id: movieDataEntity.id!,
                      useCase: sl<GetMovieTrailerByIdUseCase>(),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    VideoTitle(title: movieDataEntity.title ?? "-"),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (movieDataEntity.releaseDate != null)
                          VideoReleaseDate(
                              releaseDate: movieDataEntity.releaseDate!),
                        if (movieDataEntity.voteAverage != null)
                          VideVoteAvg(
                            voteAvg: movieDataEntity.voteAverage!,
                          )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (movieDataEntity.overview != null)
                      VideoOverview(
                        overview: movieDataEntity.overview!,
                      )
                  ],
                ),
              ),
              if (movieDataEntity.id != null) ...{
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: CategoryText(
                      title: "Recommended Movies",
                    )),
                RecommendedMovies(
                  movieId: movieDataEntity.id!,
                ),
                SizedBox(
                  height: 20,
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: CategoryText(
                      title: "Similar Movies",
                    )),
                SimilarMovies(
                  movieId: movieDataEntity.id!,
                )
              },
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ));
  }
}
