import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_reference/api/api_provider.dart';
import 'package:http/http.dart' as http;
import 'package:movie_reference/models/person_model.dart';
// import 'package:movie_reference/models/movie_model.dart';
import 'package:movie_reference/styles.dart';
// import 'package:movie_reference/styles.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class PeopleDetail extends StatefulWidget {
  // final TvShow tvShow;
  final String personId;
  const PeopleDetail({
    Key? key,
    required this.personId
  }) : super(key: key);

  @override
  _PeopleDetailState createState() => _PeopleDetailState();
}

class _PeopleDetailState extends State<PeopleDetail> {
  TextStyle header = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15);
  TextStyle normal = const TextStyle(color: Colors.white, fontSize: 14);

  PersonDetailsClass peopleDetail = PersonDetailsClass();
  bool loading = true;
  getDetail() async {
    http.Response response;
    response = await http
        .get(ApiProvider.baseApiUrl("person/${widget.personId}?language=en-US"));
    final jsonData = jsonDecode((response.body).toString());
    setState(() {
      loading = false;
      peopleDetail = PersonDetailsClass.fromJson(jsonData);
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
          "People Details",
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
                  image: NetworkImage(peopleDetail.profilePath.toString()),
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
                        peopleDetail.profilePath.toString(),
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
                            "Name",
                            style: header,
                          ),
                          Text(
                            peopleDetail.name.toString(),
                            style: normal,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Birthday",
                            style: header,
                          ),
                          Text(
                            peopleDetail.birthday!=null? DateFormat("dd MMM yyyy").format(peopleDetail.birthday!):"No data",
                            style: normal,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Text(
                          //   "First Air Date",
                          //   style: header,
                          // ),
                          // Text(
                          //   DateFormat("dd MMM yyyy")
                          //       .format(tvDetail.firstAirDate!),
                          //   style: normal,
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // Text(
                          //   "Popularity",
                          //   style: header,
                          // ),
                          // Text(
                          //   tvDetail.popularity.toString(),
                          //   style: normal,
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // Text(
                          //   "Genres",
                          //   style: header,
                          // ),
                          // Text(
                          //   tvDetail.genres
                          //       .toString(),
                          //   style: normal,
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // Text(
                          //   "Rating",
                          //   style: header,
                          // ),
                          // Row(
                          //   children: [
                          //     const Icon(Icons.star, color: Colors.yellow),
                          //     Text(
                          //       tvDetail.voteAverage.toString() +
                          //           "    " +
                          //           tvDetail.voteCount.toString() +
                          //           " Vote",
                          //       style: normal,
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Biography",
                  style: header,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  peopleDetail.biography!=""?peopleDetail.biography.toString():"No Data",
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
