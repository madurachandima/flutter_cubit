import 'package:flutter/material.dart';
import 'package:movie_app_cubit/common/widgets/appbar/app_bar.dart';
import 'package:movie_app_cubit/domain/movie/entities/movie.dart';
import 'package:movie_app_cubit/presentation/wach/widgets/vdeo_player.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieDataEntity movieDataEntity;

  const MovieWatchPage({super.key, required this.movieDataEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
      ),
      body: movieDataEntity.id == null
          ? const Center(
              child: Text("Movie id not found!"),
            )
          : VideoPlayer(
              id: movieDataEntity.id!,
            ),
    );
  }
}
