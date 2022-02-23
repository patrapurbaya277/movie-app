import 'package:flutter/material.dart';
import 'package:movie_reference/pages/movie_detail.dart';
import 'package:movie_reference/pages/tv_detail.dart';
import 'package:movie_reference/prefs/shared_pref.dart';
import 'package:movie_reference/styles.dart';
// import 'package:movie_reference/widgets/movie_item.dart';
import 'package:movie_reference/widgets/my_shimmer.dart';

class WatchLater extends StatefulWidget {
  const WatchLater({Key? key}) : super(key: key);

  @override
  _WatchLaterState createState() => _WatchLaterState();
}

class _WatchLaterState extends State<WatchLater> {
  @override
  Widget build(BuildContext context) {
    return WatchListMovie.watchList.isEmpty
        ? Center(
            child: Text(
              "No wishlist added",
              style: TextStyle(color: mainColor),
            ),
          )
        : GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent:
                    MediaQuery.of(context).size.width / 2.toDouble(),
                childAspectRatio: 13 / 20,
                crossAxisSpacing: 7,
                mainAxisSpacing: 0),
            itemCount: WatchListMovie.watchList.length,
            // itemCount: 5,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                onTap: () {
                  switch (WatchListMovie.watchList[index].type) {
                    case "movie":
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => MovieDetail(
                                movieId: WatchListMovie.watchList[index].id,
                              )));
                      break;
                    case "tv":
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => TVDetail(
                                tvId: WatchListMovie.watchList[index].id
                                    .toString(),
                              )));
                      break;
                  }
                },
                child: Container(
                    foregroundDecoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: Image.network(
                      WatchListMovie.watchList[index].image.toString(),
                      loadingBuilder: (context, child, loadingProgress) =>
                          loadingProgress == null
                              ? child
                              : MyShimmer(
                                  child: child,
                                ),
                    )),
              );
            });
  }
}
