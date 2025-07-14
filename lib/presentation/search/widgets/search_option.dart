import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/presentation/search/cubit/search_cubit.dart';
import 'package:movie_app_cubit/presentation/search/cubit/selectable_option_cubit.dart';
import 'package:movie_app_cubit/presentation/search/widgets/selectable_option.dart';

class SearchOption extends StatelessWidget {
  const SearchOption({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectableOptionCubit, SearchType>(
        builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SelectableOption(
            title: "Movie",
            isSelected:
                context.read<SelectableOptionCubit>().state == SearchType.movie,
            onTap: () {
              context.read<SelectableOptionCubit>().selectMovie();
              context.read<SearchCubit>().search(
                  query: context.read<SearchCubit>().searchController.text,
                  type: context.read<SelectableOptionCubit>().state);
            },
          ),
          const SizedBox(
            width: 16,
          ),
          SelectableOption(
            title: "Tv Series",
            isSelected:
                context.read<SelectableOptionCubit>().state == SearchType.tv,
            onTap: () {
              context.read<SelectableOptionCubit>().selectTv();
              context.read<SearchCubit>().search(
                  query: context.read<SearchCubit>().searchController.text,
                  type: context.read<SelectableOptionCubit>().state);
            },
          )
        ],
      );
    });
  }
}
