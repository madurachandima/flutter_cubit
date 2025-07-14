import 'package:flutter/material.dart';
import 'package:movie_app_cubit/common/widgets/tv/tv_card.dart';
import 'package:movie_app_cubit/domain/tv/entity/tv.dart';

class TvGridView extends StatefulWidget {
  final ScrollController tvScrollController;
  final List<TvDataEntity> tvs;

  const TvGridView(
      {super.key, required this.tvScrollController, required this.tvs});

  @override
  State<TvGridView> createState() => _TvGridViewState();
}

class _TvGridViewState extends State<TvGridView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              controller: widget.tvScrollController,
              itemCount: widget.tvs.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.6),
              itemBuilder: (context, index) {
                return TvCard(tvDataEntity: widget.tvs[index]);
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
          // }
        ],
      ),
    );
    ;
  }

  @override
  bool get wantKeepAlive => true;
}
