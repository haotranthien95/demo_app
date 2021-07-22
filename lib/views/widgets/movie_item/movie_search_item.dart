import 'package:flutter/material.dart';
import 'package:new_demo_app/models/movie.dart';

class MovieSearchItem extends StatelessWidget {
  const MovieSearchItem(
    this.movieModel, {
    Key? key,
  }) : super(key: key);
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(2, 1, 2, 1),
      decoration: BoxDecoration(
          color: Colors.black87, borderRadius: BorderRadius.circular(7)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image(
                width: 120,
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w200${movieModel.backdropPath}'),
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Container(
                      width: 120,
                      child: Center(
                          child: Text(
                        'Cannot load image',
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      )));
                },
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 4, right: 4, top: 2),
                    child: Text(
                      movieModel.oriTitle ?? "No tittle",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 4, right: 4, bottom: 4),
                    child: Row(children: [
                      Icon(
                        Icons.thumb_up,
                        color: Colors.blue,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        (movieModel.voteCount ?? 0).toString(),
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      rating(movieModel.vote ?? 0),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        (movieModel.vote ?? 0).toStringAsFixed(1),
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )
                    ]),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 4, right: 4, bottom: 4),
                    child: Text(
                      (movieModel.overview ?? ""),
                      maxLines: 2,
                      style: TextStyle(color: Colors.grey, fontSize: 9),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container rating(double rateScore) {
    return Container(
      child: Row(
        children: [
          Icon(
            rateScore > 0.5 ? Icons.star : Icons.star_outline_rounded,
            size: 10,
            color: Colors.orange,
          ),
          Icon(
            rateScore > 2 ? Icons.star : Icons.star_outline_rounded,
            size: 10,
            color: Colors.orange,
          ),
          Icon(
            rateScore > 4 ? Icons.star : Icons.star_outline_rounded,
            color: Colors.orange,
            size: 10,
          ),
          Icon(
            rateScore > 6 ? Icons.star : Icons.star_outline_rounded,
            color: Colors.orange,
            size: 10,
          ),
          Icon(
            rateScore > 8 ? Icons.star : Icons.star_outline_rounded,
            color: Colors.orange,
            size: 10,
          ),
        ],
      ),
    );
  }
}
