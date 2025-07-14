import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/presentation/search/cubit/search_cubit.dart';
import 'package:movie_app_cubit/presentation/search/cubit/selectable_option_cubit.dart';

class SearchFields extends StatelessWidget {
  const SearchFields({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.read<SearchCubit>().searchController,
      onChanged: (text) {
        if (text.isEmpty) return;
        context.read<SearchCubit>().search(
            query: text, type: context.read<SelectableOptionCubit>().state);
      },
      decoration: const InputDecoration(
        hintText: "Search",
      ),
    );
  }
}
