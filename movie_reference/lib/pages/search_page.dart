import 'package:flutter/material.dart';
import 'package:movie_reference/api/api_provider.dart';
import 'package:movie_reference/styles.dart';
import 'package:movie_reference/widgets/movies_builder.dart';
import 'package:movie_reference/widgets/people_builder.dart';
import 'package:movie_reference/widgets/tv_shows_builder.dart';

class SearchPage extends StatefulWidget {
  // final String type;
  const SearchPage({
    Key? key,
    // required this.type
  }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();
  FocusNode focus = FocusNode();
  ApiProvider provider = ApiProvider();
  String searchQuery = ""; 
  // bool doSearch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: TextField(
            cursorColor: mainColor,
            style: const TextStyle(color: Colors.white),
            textInputAction: TextInputAction.search,
            controller: search,
            onSubmitted: (value) {
              setState(() {
                searchQuery=value;
                provider.searchMovies(searchQuery);
              });
              // provider.searchTest(search.text);
            },
            focusNode: focus,
            decoration: const InputDecoration(
                hintText: "Search..",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: InputBorder.none),
          ),
        ),
        body: searchQuery==""?const SizedBox(): ListView(
          children: [
            MoviesBuilder(
                title: "Movie Results",
                future: provider.searchMovies(searchQuery)),
            TVShowsBuilder(
                title: "TV Shows Results",
                future: provider.searchTVShows(searchQuery)),
            PeopleBuilder(
                title: "People Results",
                future: provider.searchPerson(searchQuery)),
          ],
        )
        );
  }
}
