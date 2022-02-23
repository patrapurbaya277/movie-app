import 'package:flutter/material.dart';
import 'package:movie_reference/models/movie_model.dart';
import 'package:movie_reference/widgets/my_shimmer.dart';
// import 'package:shimmer/shimmer.dart';

import 'movie_item.dart';

class MoviesBuilder extends StatelessWidget {
  final String title;
  final Future<List<Movie>> future;
  const MoviesBuilder({Key? key, required this.title, required this.future})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          FutureBuilder<List<Movie>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Movie> listData = List.from(snapshot.data!.toList());
                return SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      const SizedBox(width: 15),
                      ...listData
                          .map((e) => MovieItem(
                                movie: e,
                              ))
                          .toList(),
                      const SizedBox(width: 15),
                    ],
                  ),
                );
              }
              if(!snapshot.hasData){
                return const Text("No Data",
                  style: TextStyle(color: Colors.grey));
              }
              return SizedBox(
                height: 200,
                child: MyShimmer(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return const DummyMovieItem();
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
