import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_reference/api/api_provider.dart';
import 'package:movie_reference/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_reference/prefs/saved_movie.dart';
import 'package:movie_reference/prefs/shared_pref.dart';
import 'package:movie_reference/styles.dart';
// import 'package:movie_reference/styles.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class MovieDetail extends StatefulWidget {
  final String? movieId;
  // final Movie movie;
  const MovieDetail({
    Key? key,
    this.movieId,
    // required this.movie,
  }) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  TextStyle header = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15);
  TextStyle normal = const TextStyle(color: Colors.white, fontSize: 14);
  MovieDetailClass movieDetail = MovieDetailClass();
  SavedMovie savedMovie = SavedMovie();
  bool loading = true;

  getDetail() async {
    http.Response response;
    response = await http
        .get(ApiProvider.baseApiUrl("movie/${widget.movieId}?language=en-US"));
    final jsonData = jsonDecode((response.body).toString());
    if (mounted) {
      setState(() {
        loading = false;
        movieDetail = MovieDetailClass.fromJson(jsonData);
        savedMovie = SavedMovie(
            id: movieDetail.id.toString(),
            image: movieDetail.posterPath,
            type: "movie");
      });
    }
  }

  @override
  void initState() {
    getDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Movie Details"),
        // actions: [
        //   InkWell(
        //     onTap: () {
        //       if (WatchListMovie.watchList
        //           .where((e) => e.id == savedMovie.id)
        //           .isEmpty) {
        //         WatchListMovie.addToList(savedMovie);
        //         WatchListMovie.saveList();
        //         setState(() {});
        //       } else if (WatchListMovie.watchList
        //           .where((e) => e.id == savedMovie.id)
        //           .isNotEmpty) {
        //         WatchListMovie.watchList
        //             .removeWhere((element) => element.id == savedMovie.id);
        //         WatchListMovie.saveList();
        //         setState(() {});
        //       }
        //     },
        //     child: WatchListMovie.watchList
        //             .where((e) => e.id == savedMovie.id)
        //             .isEmpty
        //         ? const Icon(
        //             Icons.playlist_add,
        //             color: Colors.white,
        //           )
        //         : const Icon(
        //             Icons.playlist_add_check,
        //             color: Colors.white,
        //           ),
        //   ),
        //   const SizedBox(width: 20),
        // ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextButton(
          onPressed: () {
            if (WatchListMovie.watchList
                .where((e) => e.id == savedMovie.id)
                .isEmpty) {
              WatchListMovie.addToList(savedMovie);
              WatchListMovie.saveList();
              setState(() {});
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Added to Watch List"),
                  behavior: SnackBarBehavior.fixed,
                ),
              );
            } else if (WatchListMovie.watchList
                .where((e) => e.id == savedMovie.id)
                .isNotEmpty) {
              WatchListMovie.watchList
                  .removeWhere((element) => element.id == savedMovie.id);
              WatchListMovie.saveList();
              setState(() {});
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Removed from Watch List")));
            }
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: WatchListMovie.watchList
                      .where((e) => e.id == savedMovie.id)
                      .isEmpty
                  ? mainColor
                  : mainColorDark,
              shape: BoxShape.circle,
            ),
            child: WatchListMovie.watchList
                    .where((e) => e.id == savedMovie.id)
                    .isEmpty
                ? const Icon(
                    Icons.playlist_add,
                    color: Colors.white,
                    size: 30,
                  )
                : Icon(
                    Icons.playlist_add_check,
                    color: Colors.white.withOpacity(0.5),
                    size: 30,
                  ),
          ),
        ),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(
                color: mainColor,
              ),
            )
          : Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(movieDetail.posterPath.toString()),
                        fit: BoxFit.cover),
                  ),
                  foregroundDecoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.8)),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            height: 300,
                            width: 202.5,
                            child: Image.network(
                              movieDetail.posterPath.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Title",
                                  style: header,
                                ),
                                Text(
                                  movieDetail.title.toString(),
                                  style: normal,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Original Title",
                                  style: header,
                                ),
                                Text(
                                  movieDetail.originalTitle.toString(),
                                  style: normal,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Release Date",
                                  style: header,
                                ),
                                Text(
                                  DateFormat("dd MMM yyyy")
                                      .format(movieDetail.releaseDate!),
                                  style: normal,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Popularity",
                                  style: header,
                                ),
                                Text(
                                  movieDetail.popularity.toString(),
                                  style: normal,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Genres",
                                  style: header,
                                ),
                                Text(
                                  movieDetail.genres.toString(),
                                  style: normal,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Rating",
                                  style: header,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.yellow),
                                    Text(
                                      movieDetail.voteAverage.toString() +
                                          "    " +
                                          movieDetail.voteCount.toString() +
                                          " Vote",
                                      style: normal,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Overview",
                        style: header,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        movieDetail.overview != ""
                            ? movieDetail.overview.toString()
                            : "No Data",
                        style: normal,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
