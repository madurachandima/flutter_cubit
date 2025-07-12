import 'package:flutter/material.dart';
import 'package:movie_app_cubit/common/widgets/appbar/app_bar.dart';
import 'package:movie_app_cubit/core/entity/trailer_entity.dart';
import 'package:movie_app_cubit/domain/tv/entity/tv.dart';
import 'package:movie_app_cubit/domain/tv/usecases/get_tv_trailer_by_id.dart';
import 'package:movie_app_cubit/presentation/home/widgets/category_text.dart';
import 'package:movie_app_cubit/presentation/watch/widgets/recommended_tv_series.dart';
import 'package:movie_app_cubit/presentation/watch/widgets/similar_tv_series.dart';
import 'package:movie_app_cubit/presentation/watch/widgets/vdeo_player.dart';
import 'package:movie_app_cubit/presentation/watch/widgets/vide_vote_avg.dart';
import 'package:movie_app_cubit/presentation/watch/widgets/video_overview.dart';
import 'package:movie_app_cubit/presentation/watch/widgets/video_release_date.dart';
import 'package:movie_app_cubit/presentation/watch/widgets/video_title.dart';
import 'package:movie_app_cubit/service_locator.dart';

class TvWatchPage extends StatelessWidget {
  final TvDataEntity tvDataEntity;

  const TvWatchPage({super.key, required this.tvDataEntity});

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
              tvDataEntity.id == null
                  ? const Center(
                      child: Text("Tv id not found!"),
                    )
                  : VideoPlayer<List<TrailerDataEntity>>(
                      id: tvDataEntity.id!,
                      useCase: sl<GetTvTrailerByIdUseCase>(),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    VideoTitle(title: tvDataEntity.name ?? "-"),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (tvDataEntity.firstAirDate != null)
                          VideoReleaseDate(
                              releaseDate: tvDataEntity.firstAirDate!),
                        if (tvDataEntity.voteAverage != null)
                          VideVoteAvg(
                            voteAvg: tvDataEntity.voteAverage!,
                          )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (tvDataEntity.overview != null)
                      VideoOverview(
                        overview: tvDataEntity.overview!,
                      )
                  ],
                ),
              ),
              if (tvDataEntity.id != null) ...{
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: CategoryText(
                      title: "Recommended Tv Series",
                    )),
                RecommendedTvSeries(
                  tvId: tvDataEntity.id!,
                ),
                SizedBox(
                  height: 20,
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: CategoryText(
                      title: "Similar Tv Series",
                    )),
                SimilarTvSeries(
                  tvId: tvDataEntity.id!,
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
