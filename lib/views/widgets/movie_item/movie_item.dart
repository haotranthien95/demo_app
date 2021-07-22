import 'package:flutter/material.dart';
import 'package:new_demo_app/models/movie.dart';

class MovieItem extends StatelessWidget {
  const MovieItem(
    this.movieModel, {
    Key? key,
  }) : super(key: key);
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width / 2,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image(
            height: 400,
            image: NetworkImage(
                'https://image.tmdb.org/t/p/w200${movieModel.posterPath}'),
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Container(child: Center(child: Text('Cannot load image')));
            },
            fit: BoxFit.cover,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 4, right: 4, top: 10),
                  decoration: BoxDecoration(color: Colors.black45),
                  child: Text(
                    movieModel.oriTitle ?? "No tittle",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 4, right: 4, bottom: 4),
                  decoration: BoxDecoration(color: Colors.black45),
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
                )
              ],
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
