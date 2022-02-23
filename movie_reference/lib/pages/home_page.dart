// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_reference/api/api_provider.dart';
// import 'package:movie_reference/models/movie_model.dart';
// import 'package:movie_reference/widgets/movie_item.dart';
import 'package:movie_reference/widgets/movies_builder.dart';
import 'package:movie_reference/widgets/people_builder.dart';
import 'package:movie_reference/widgets/tvshows_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiProvider provider = ApiProvider();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MoviesBuilder(
            title: "Top Rated Movies", future: provider.fetchTopRatedMovies()),
        MoviesBuilder(
            title: "Upcoming Movies", future: provider.fetchUpcomingMovies()),
        MoviesBuilder(
            title: "Now Playing Movies",
            future: provider.fetchNowPlayingMovies()),
        MoviesBuilder(
            title: "Popular Movies", future: provider.fetchPopularMovies()),
        TVShowsBuilder(
            title: "Popular TV Shows", future: provider.fetchPopularTVShows()),
        TVShowsBuilder(
            title: "Top Rated TV Shows",
            future: provider.fetchTopRatedTVShows()),
        TVShowsBuilder(
            title: "On The Air TV Shows", future: provider.fetchOnTheAirTVShows()),
            TVShowsBuilder(
            title: "Airing Today TV Shows", future: provider.fetchAiringTodayTVShows()),
        PeopleBuilder(title: "Popular People", future: provider.fetchPopularPerson())
      ],
    );
  }
}
