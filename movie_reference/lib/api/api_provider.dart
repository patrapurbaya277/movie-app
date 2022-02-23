import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_reference/models/movie_model.dart';
import 'package:movie_reference/models/person_model.dart';
import 'package:movie_reference/models/tv_show_model.dart';

class ApiProvider {
  static Uri baseApiUrl(String endPoint) =>
      Uri.parse("https://api.themoviedb.org/3/$endPoint&api_key=$apiKey");
  static String apiKey = "f2e58427348f0cdfefa721f58ba7cc0e";

  Future<Movie> getMovieDetails(String id) async {
    http.Response response;
    response = await http.get(baseApiUrl("movie/$id?language=en-US"));
    final jsonData = jsonDecode((response.body).toString());
    return Movie.fromJson(jsonData);
  }

  Future<TvShow> getTVDetails(String id) async {
    http.Response response;
    response = await http.get(baseApiUrl("tv/$id?language=en-US"));
    final jsonData = jsonDecode((response.body).toString());
    return TvShow.fromJson(jsonData);
  }

  Future<Person> getPersonDetails(String id) async {
    http.Response response;
    response = await http.get(baseApiUrl("tv/$id?language=en-US"));
    final jsonData = jsonDecode((response.body).toString());
    return Person.fromJson(jsonData);
  }

  Future<List<Movie>> fetchTopRatedMovies() async {
    http.Response response;
    response =
        await http.get(baseApiUrl("movie/top_rated?language=en-US&page=1"));
    final jsonData = jsonDecode((response.body).toString());
    List data = List.from(jsonData["results"]);
    return data.map((e) => Movie.fromJson(e)).toList().cast();
  }

  Future<List<Movie>> fetchUpcomingMovies() async {
    http.Response response;
    response =
        await http.get(baseApiUrl("movie/upcoming?language=en-US&page=1"));
    final jsonData = jsonDecode((response.body).toString());
    List data = List.from(jsonData["results"]);
    return data.map((e) => Movie.fromJson(e)).toList().cast();
  }

  Future<List<Movie>> fetchNowPlayingMovies() async {
    http.Response response;
    response =
        await http.get(baseApiUrl("movie/now_playing?language=en-US&page=1"));
    final jsonData = jsonDecode((response.body).toString());
    List data = List.from(jsonData["results"]);
    return data.map((e) => Movie.fromJson(e)).toList().cast();
  }

  Future<List<Movie>> fetchPopularMovies() async {
    http.Response response;
    response =
        await http.get(baseApiUrl("movie/popular?language=en-US&page=1"));
    final jsonData = jsonDecode((response.body).toString());
    List data = List.from(jsonData["results"]);
    return data.map((e) => Movie.fromJson(e)).toList().cast();
  }

  Future<List<TvShow>> fetchPopularTVShows() async {
    http.Response response;
    response = await http.get(baseApiUrl("tv/popular?language=en-US&page=1"));
    final jsonData = jsonDecode((response.body).toString());
    List data = List.from(jsonData["results"]);
    return data.map((e) => TvShow.fromJson(e)).toList().cast();
  }

  Future<List<TvShow>> fetchTopRatedTVShows() async {
    http.Response response;
    response = await http.get(baseApiUrl("tv/top_rated?language=en-US&page=1"));
    final jsonData = jsonDecode((response.body).toString());
    List data = List.from(jsonData["results"]);
    return data.map((e) => TvShow.fromJson(e)).toList().cast();
  }

  Future<List<TvShow>> fetchOnTheAirTVShows() async {
    http.Response response;
    response =
        await http.get(baseApiUrl("tv/on_the_air?language=en-US&page=1"));
    final jsonData = jsonDecode((response.body).toString());
    List data = List.from(jsonData["results"]);
    return data.map((e) => TvShow.fromJson(e)).toList().cast();
  }

  Future<List<TvShow>> fetchAiringTodayTVShows() async {
    http.Response response;
    response =
        await http.get(baseApiUrl("tv/airing_today?language=en-US&page=1"));
    final jsonData = jsonDecode((response.body).toString());
    List data = List.from(jsonData["results"]);
    return data.map((e) => TvShow.fromJson(e)).toList().cast();
  }

  Future<List<Person>> fetchPopularPerson() async {
    http.Response response;
    response =
        await http.get(baseApiUrl("person/popular?language=en-US&page=1"));
    final jsonData = jsonDecode((response.body).toString());
    List data = List.from(jsonData["results"]);
    return data.map((e) => Person.fromJson(e)).toList().cast();
  }

  Future<List<Person>> searchPerson(String query) async {
    http.Response response;
    response = await http
        .get(baseApiUrl("search/person?language=en-US&page=1&query=" + query));
    final jsonData = jsonDecode((response.body).toString());
    List data = List.from(jsonData["results"]);
    data.removeWhere((element) => element["name"]==null||element["name"]==""||element["profile_path"]==null);
    return data.map((e) => Person.fromJson(e)).toList().cast();
  }

  Future<List<TvShow>> searchTVShows(String query) async {
    http.Response response;
    response = await http
        .get(baseApiUrl("search/tv?language=en-US&page=1&query=" + query));
    final jsonData = jsonDecode((response.body).toString());
    List data = List.from(jsonData["results"]);
    data.removeWhere((element) => element["name"]==null||element["name"]==""||element["poster_path"]==null);
    return data.map((e) => TvShow.fromJson(e)).toList().cast();
  }

  Future<List<Movie>> searchMovies(String query) async {
    http.Response response;
    response = await http
        .get(baseApiUrl("search/movie?language=en-US&page=1&query=" + query));
    final jsonData = jsonDecode((response.body).toString());
    List data = List.from(jsonData["results"]);
    data.removeWhere((element) => element["title"]==null||element["name"]==""||element["poster_path"]==null);
    return data.map((e) => Movie.fromJson(e)).toList().cast();
  }
}
