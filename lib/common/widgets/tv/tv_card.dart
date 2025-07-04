import 'package:flutter/material.dart';
import 'package:movie_app_cubit/core/config/theme/app_colors.dart';
import 'package:movie_app_cubit/domain/tv/entity/tv.dart';

class TvCard extends StatelessWidget {
  final TvDataEntity tvDataEntity;

  const TvCard({required this.tvDataEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //AppNavigator.push(context, MovieWatchPage(movieEntity: movieEntity,));
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image:
                        NetworkImage(tvDataEntity.providePosterPath())),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tvDataEntity.name ?? "-",
                      style: const TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amber,
                        ),
                        Text(
                          tvDataEntity.voteAverage == null
                              ? "-"
                              : ' ${tvDataEntity.voteAverage!.toStringAsFixed(1)}',
                          style: const TextStyle(fontSize: 10),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
