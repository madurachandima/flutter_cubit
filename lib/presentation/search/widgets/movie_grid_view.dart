import 'package:flutter/material.dart';
import 'package:movie_app_cubit/common/widgets/movie/movie_card.dart';
import 'package:movie_app_cubit/domain/movie/entities/movie.dart';

class MovieGridView extends StatefulWidget {
  final ScrollController movieScrollController;
  final List<MovieDataEntity> movies;

  const MovieGridView(
      {super.key, required this.movieScrollController, required this.movies});

  @override
  State<MovieGridView> createState() => _MovieGridViewState();
}

class _MovieGridViewState extends State<MovieGridView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              controller: widget.movieScrollController,
              itemCount: widget.movies.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.6),
              itemBuilder: (context, index) {
                return MovieCard(movieDataEntity: widget.movies[index]);
              },
            ),
          ),
          // if (state is SearchPaginationLoadingState) ...{
          //   const Center(
          //     child: LinearProgressIndicator(),
          //   ),
          //   const SizedBox(
          //     height: 2,
          //   )
          // },
        ],
      ),
    );
    ;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
