import 'package:get/get.dart';
import 'package:new_demo_app/models/movie.dart';
import 'package:new_demo_app/services/search_movies_service.dart';

class SearchViewModel extends GetxController {
  List<MovieModel> listMovies = <MovieModel>[].obs;
  int page = 0;
  bool inProcess = false;
  bool lastPage = false;
  String lastSearchText = "";
  final moviesService = MoviesService();

  searchMovies(
      {String? searchText, bool nextPage = false, bool refresh = false}) async {
    lastSearchText = searchText ?? lastSearchText;
    print("SearchText:[$lastSearchText]");
    if (lastSearchText == '') {
      return print("Do not input search data");
    }
    if (refresh) {
      page = 0;
      lastPage = false;
    }
    if (page > 0 && !nextPage) {
      return print("Already fetch"); // Prevent rebuild many times
    }
    if (nextPage && lastPage) {
      return print("Last page");
    }
    if (inProcess) {
      print("Data is fetching");
      return;
    } else {
      print("API call:Start sending request");
      inProcess = true;
    }
    print("before Data length: " + listMovies.length.toString());

    page++;
    await moviesService.searchMovie(lastSearchText, page: page).then((value) {
      if (value.length == 0) {
        lastPage = true;
      }
      print("API call:Finished");

      refresh ? listMovies.clear() : {};
      listMovies.addAll(value);
      print("Data length: " + listMovies.length.toString());
      inProcess = false;
    }).catchError((err) {
      inProcess = false;
      throw Exception(err);
    });
  }
}
