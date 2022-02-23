import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_reference/api/api_provider.dart';
import 'package:movie_reference/genres.dart';
import 'package:movie_reference/models/movie_model.dart';
import 'package:http/http.dart' as http;
// import 'package:movie_reference/models/movie_model.dart';
import 'package:movie_reference/models/tvshow_model.dart';
import 'package:movie_reference/styles.dart';
// import 'package:movie_reference/styles.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class TVDetail extends StatefulWidget {
  // final TvShow tvShow;
  final String tvId;
  const TVDetail({
    Key? key,
    // required this.tvShow,
    required this.tvId
  }) : super(key: key);

  @override
  _TVDetailState createState() => _TVDetailState();
}

class _TVDetailState extends State<TVDetail> {
  TextStyle header = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15);
  TextStyle normal = const TextStyle(color: Colors.white, fontSize: 14);

  TvShowDetailsClass tvDetail = TvShowDetailsClass();
  bool loading = true;
  getDetail() async {
    http.Response response;
    response = await http
        .get(ApiProvider.baseApiUrl("tv/${widget.tvId}?language=en-US"));
    final jsonData = jsonDecode((response.body).toString());
    setState(() {
      loading = false;
      tvDetail = TvShowDetailsClass.fromJson(jsonData);
    });
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
        title: const Text(
          "TV Show Details",
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.playlist_add,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 20),
        ],
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
                  image: NetworkImage(tvDetail.posterPath.toString()),
                  fit: BoxFit.cover),
            ),
            foregroundDecoration:
                BoxDecoration(color: Colors.black.withOpacity(0.9)),
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
                          border: Border.all(color: Colors.white, width: 2)),
                      height: 300,
                      width: 202.5,
                      child: Image.network(
                        tvDetail.posterPath.toString(),
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
                            tvDetail.name.toString(),
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
                            tvDetail.originalName.toString(),
                            style: normal,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "First Air Date",
                            style: header,
                          ),
                          Text(
                            DateFormat("dd MMM yyyy")
                                .format(tvDetail.firstAirDate!),
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
                            tvDetail.popularity.toString(),
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
                            tvDetail.genres
                                .toString(),
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
                              const Icon(Icons.star, color: Colors.yellow),
                              Text(
                                tvDetail.voteAverage.toString() +
                                    "    " +
                                    tvDetail.voteCount.toString() +
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
                  tvDetail.overview!=""?tvDetail.overview.toString():"No Data",
                  style: normal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
