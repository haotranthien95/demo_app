import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart';
import 'package:new_demo_app/models/movie.dart';

class MoviesService {
  Client client = Client();
  Future<List<MovieModel>> searchMovie(String searchText,
      {int page = 1}) async {
    var result;
    await client
        .get(
      Uri.https("api.themoviedb.org", "/3/search/movie", {
        "api_key": "b62ae36dadabb3497c9915229cd41af7",
        "query": searchText,
        "page": "$page"
      }),
    )
        .then((value) {
      result = onValue(value);
    }).onError((error, stackTrace) {
      return Future.error(error.toString(), stackTrace);
    });
    return result;
  }

  static onValue(Response response) {
    final Map<String, dynamic> responseData = json.decode(response.body);
    List<MovieModel> data = [];

    if (response.statusCode == 200) {
      for (var element in responseData['results']) {
        data.add(MovieModel.fromObject(element));
      }
      return data;
    } else {
      return Future.error("Undefined Error");
    }
  }
}
