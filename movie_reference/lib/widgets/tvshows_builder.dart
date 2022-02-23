import 'package:flutter/material.dart';
// import 'package:movie_reference/models/movie_model.dart';
import 'package:movie_reference/models/tvshow_model.dart';
import 'package:movie_reference/widgets/my_shimmer.dart';
// import 'package:shimmer/shimmer.dart';

// import 'movie_item.dart';
import 'tv_item.dart';

class TVShowsBuilder extends StatelessWidget {
  final String title;
  final Future<List<TvShow>> future;
  const TVShowsBuilder({Key? key, required this.title, required this.future})
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
          FutureBuilder<List<TvShow>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<TvShow> listData = List.from(snapshot.data!.toList());
                return SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      const SizedBox(width: 15),
                      ...listData
                          .map((e) => TVItem(
                                tvshow: e,
                              ))
                          .toList(),
                      const SizedBox(width: 15),
                    ],
                  ),
                );
              }
              return SizedBox(
                height: 200,
                child: MyShimmer(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return const DummyTVItem();
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
