import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_demo_app/view_models/search_view_model.dart';
import 'package:new_demo_app/views/widgets/movie_item/movie_search_item.dart';

class SearchMovieTab extends StatelessWidget {
  const SearchMovieTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _inputController = TextEditingController();
    final SearchViewModel searchViewModel = Get.put(SearchViewModel());
    final _scrollController = ScrollController();
    _scrollController.addListener(() {
      final maxScrollExtent = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      if (maxScrollExtent - currentScroll == 0) {
        searchViewModel.searchMovies(nextPage: true);
      }
    });

    return Obx(() => Column(
          children: [
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.only(right: 4),
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Row(
                children: [
                  IconButton(
                      constraints: BoxConstraints.expand(height: 50, width: 35),
                      onPressed: () {
                        searchViewModel.searchMovies(
                            searchText: _inputController.text, refresh: true);
                      },
                      icon: Icon(Icons.search_outlined)),
                  Expanded(
                    child: Container(
                      child: CupertinoTextField(
                        controller: _inputController,
                        clearButtonMode: OverlayVisibilityMode.editing,
                        decoration: BoxDecoration(color: Colors.grey[300]),
                        placeholder: "What movies...",
                        onSubmitted: (text) {
                          searchViewModel.searchMovies(
                              searchText: text, refresh: true);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  CupertinoSliverRefreshControl(
                    onRefresh: () async {
                      print("Refresh===");
                      searchViewModel.searchMovies(refresh: true);
                    },
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return MovieSearchItem(
                            searchViewModel.listMovies[index]);
                      },
                      childCount: searchViewModel.listMovies.length,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
