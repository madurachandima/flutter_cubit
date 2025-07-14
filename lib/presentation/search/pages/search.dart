import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_cubit/common/widgets/appbar/app_bar.dart';
import 'package:movie_app_cubit/presentation/search/cubit/search_cubit.dart';
import 'package:movie_app_cubit/presentation/search/cubit/selectable_option_cubit.dart';
import 'package:movie_app_cubit/presentation/search/widgets/search_content.dart';
import 'package:movie_app_cubit/presentation/search/widgets/search_fields.dart';
import 'package:movie_app_cubit/presentation/search/widgets/search_option.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text("Search"),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SelectableOptionCubit()),
          BlocProvider(create: (context) => SearchCubit()),
        ],
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SearchFields(),
              SizedBox(
                height: 16,
              ),
              SearchOption(),
              SizedBox(
                height: 16,
              ),
              SearchContent()
            ],
          ),
        ),
      ),
    );
  }
}
