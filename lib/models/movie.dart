import 'dart:convert';

class MovieModel {
  bool? _adult;
  String? _backdropPath;
  List<dynamic>? _genreIDs;
  int? _id;
  String? _lang;
  String? _oriTitle;
  String? _overview;
  double? _popularity;
  String? _posterPath;
  String? _releaseDate;
  String? _title;
  bool? _video;
  double? _vote;
  int? _voteCount;

  bool? get adult => this._adult;
  String? get backdropPath => this._backdropPath;
  List<dynamic>? get genreIDs => this._genreIDs;
  int? get id => this._id;
  String? get lang => this._lang;
  String? get oriTitle => this._oriTitle;
  String? get overview => this._overview;
  double? get popularity => this._popularity;
  String? get posterPath => this._posterPath;
  String? get releaseDate => this._releaseDate;
  String? get title => this._title;
  bool? get video => this._video;
  double? get vote => this._vote;
  int? get voteCount => this._voteCount;

  set adult(bool? value) => this._adult = value;
  set backdropPath(String? value) => this._backdropPath = value;
  set genreIDs(List<dynamic>? value) => this._genreIDs = value;
  set id(int? value) => this._id = value;
  set lang(String? value) => this._lang = value;
  set oriTitle(String? value) => this._oriTitle = value;
  set overview(String? value) => this._overview = value;
  set popularity(double? value) => this._popularity = value;
  set posterPath(String? value) => this._posterPath = value;
  set releaseDate(value) => this._releaseDate = value;
  set title(value) => this._title = value;
  set video(value) => this._video = value;
  set vote(value) => this._vote = value;
  set voteCount(value) => this._voteCount = value;
  //           "vote_count": 637

  MovieModel.fromObject(dynamic object) {
    _adult = object["adult"];
    // "adult": false,
    _backdropPath = object["backdrop_path"];
    //           "backdrop_path": "/vu5Y8qFqlzcboDbbZIMTAgj0KLb.jpg",

    _genreIDs = object["genre_ids"];
    //           "genre_ids": [
    //               27,
    //               9648
    //           ],

    _id = object["id"];
    //           "id": 591273,
    _lang = object["original_language"];
    //           "original_language": "en",
    _oriTitle = object["original_title"];
    //           "original_title": "Fear Street: 1994",
    _overview = object["overview"];
    //           "overview": "In 1994, a group of teenagers discovers that the terrifying events which have haunted their town for generations ​are all connected — and that they may be the next targets.",
    _popularity = object["popularity"];
    //           "popularity": 1349.85,
    _posterPath = object["poster_path"];
    //           "poster_path": "/9J9Wy39ZjrVmfk7yMkulpcI5sy0.jpg",
    _releaseDate = object["release_date"];

    //           "release_date": "2021-06-28",
    _title = object["title"];
    //           "title": "Fear Street: 1994",
    _video = object["video"];
    //           "video": false,
    _vote = double.parse(object["vote_average"].toString());
    //           "vote_average": 6.8,
    _voteCount = object["vote_count"];
  }
}
