import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/common/helper/applogger/app_logger.dart';
import 'package:movie_app_cubit/common/widgets/movie/movie_card.dart';
import 'package:movie_app_cubit/common/widgets/tv/tv_card.dart';
import 'package:movie_app_cubit/presentation/search/cubit/search_cubit.dart';
import 'package:movie_app_cubit/presentation/search/cubit/search_state.dart';
import 'package:movie_app_cubit/presentation/search/cubit/selectable_option_cubit.dart';

class SearchContent extends StatefulWidget {
  const SearchContent({super.key});

  @override
  State<SearchContent> createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent>
    with AutomaticKeepAliveClientMixin {
  final ScrollController movieScrollController = ScrollController();
  final ScrollController tvScrollController = ScrollController();
  late SearchCubit _searchCubit;

  @override
  void initState() {
    _searchCubit = context.read<SearchCubit>();
    movieScrollController.addListener(movieListen);
    tvScrollController.addListener(tvListen);
    super.initState();
  }

  void movieListen() {
    double maxScroll = movieScrollController.position.maxScrollExtent;
    double currentScroll = movieScrollController.position.pixels;
    double delta = MediaQuery.of(context).size.width;

    if (maxScroll - currentScroll <= delta) {
      if (_searchCubit.state is! SearchPaginationLoadingState &&
          _searchCubit.haseMovieNextPage) {
        _searchCubit.search(
            query: _searchCubit.searchController.text,
            type: context.read<SelectableOptionCubit>().state,
            page: _searchCubit.moviePage);
      }
    }
  }

  void tvListen() {
    double maxScroll = tvScrollController.position.maxScrollExtent;
    double currentScroll = tvScrollController.position.pixels;
    double delta = MediaQuery.of(context).size.width;

    if (maxScroll - currentScroll <= delta) {
      if (_searchCubit.state is! SearchPaginationLoadingState &&
          _searchCubit.haseTvNextPage) {
        _searchCubit.search(
            query: _searchCubit.searchController.text,
            type: context.read<SelectableOptionCubit>().state,
            page: _searchCubit.tvPage);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    movieScrollController.dispose();
    tvScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, curr) {
        return curr is MoviesLoaded ||
            curr is TvLoaded ||
            curr is SearchLoadingState ||
            curr is SearchErrorState;
      },
      builder: (context, state) {
        if (state is MoviesLoaded) {
          return Expanded(
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    controller: movieScrollController,
                    itemCount: state.movies.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.6),
                    itemBuilder: (context, index) {
                      return MovieCard(movieDataEntity: state.movies[index]);
                    },
                  ),
                ),
                if (state is SearchPaginationLoadingState) ...{
                  const Center(
                    child: LinearProgressIndicator(),
                  ),
                  const SizedBox(
                    height: 2,
                  )
                },
              ],
            ),
          );
        }

        if (state is TvLoaded) {
          return Expanded(
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    controller: tvScrollController,
                    itemCount: state.tvs.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.6),
                    itemBuilder: (context, index) {
                      return TvCard(tvDataEntity: state.tvs[index]);
                    },
                  ),
                ),
                if (state is SearchPaginationLoadingState) ...{
                  const Center(
                    child: LinearProgressIndicator(),
                  ),
                  const SizedBox(
                    height: 2,
                  )
                }
              ],
            ),
          );
        }

        if (state is SearchLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is SearchErrorState) {
          return Center(
            child: Text(state.message),
          );
        }

        return const SizedBox();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
