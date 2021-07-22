import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_demo_app/view_models/movie_view_model.dart';
import 'package:new_demo_app/views/widgets/movie_item/movie_item.dart';

class PopularMoviesList extends StatelessWidget {
  const PopularMoviesList({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final MovieViewModel movieViewModel = Get.put(MovieViewModel());
    final _scrollController = ScrollController();
    _scrollController.addListener(() {
      final maxScrollExtent = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      if (maxScrollExtent - currentScroll == 0) {
        movieViewModel.fetchPopularMovies(nextPage: true);
      }
    });
    // MovieViewModel extends GetxController

    movieViewModel.fetchPopularMovies(); // Call API
    print("Render");
    return Obx(() => Container(
        margin: EdgeInsets.only(left: 2, right: 2),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            CupertinoSliverRefreshControl(
              onRefresh: () async {
                movieViewModel.fetchPopularMovies(refresh: true);
              },
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 2,
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 2 / 3),
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return MovieItem(movieViewModel.listMovies[index]);
              }, childCount: movieViewModel.listMovies.length),
            )
          ],
        )));
  }
}
