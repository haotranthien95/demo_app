import 'package:get/get.dart';
import 'package:new_demo_app/models/movie.dart';
import 'package:new_demo_app/services/movies_service.dart';

class MovieViewModel extends GetxController {
  List<MovieModel> listMovies = <MovieModel>[].obs;
  int page = 0;
  bool inProcess = false;
  bool lastPage = false;
  final moviesService = MoviesService();

  fetchPopularMovies({bool nextPage = false, bool refresh = false}) async {
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
      print("API call:Start sending request:MovieViewModel");
      inProcess = true;
    }

    page++;
    await moviesService.fetchHotTrendMovie(page).then((value) {
      if (value.length == 0) {
        lastPage = true;
      }
      print("API call:Finished:MovieViewModel");

      refresh ? listMovies = value : listMovies.addAll(value);
      print("Data length: " + listMovies.length.toString());
      inProcess = false;
    }).catchError((err) {
      inProcess = false;
      throw Exception(err);
    });
  }
}
