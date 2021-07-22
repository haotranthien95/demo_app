import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart';
import 'package:new_demo_app/models/movie.dart';

class MoviesService {
  Client client = Client();
  Future<List<MovieModel>> fetchHotTrendMovie(int page) async {
    var result;
    print("Before Send");
    await client
        .get(
      Uri.https("api.themoviedb.org", "/3/movie/popular",
          {"api_key": "b62ae36dadabb3497c9915229cd41af7", "page": "$page"}),
    )
        .then((value) {
      print("After Send");
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
