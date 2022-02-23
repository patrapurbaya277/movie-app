import 'dart:convert';

import 'package:movie_reference/models/movie_model.dart';
import 'package:movie_reference/prefs/savedMovie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WatchListMovie {
  static List<SavedMovie> watchList = [];
  static SharedPreferences? prefs;

  static addToList(SavedMovie item) {
    if (!watchList.contains(item)) {
      watchList.add(item);
    } else {
      // ignore: avoid_print
      print("already in the list");
    }
  }

  static deleteItem(SavedMovie item) {
    watchList.remove(item);
  }

  static saveList() async {
    prefs = await SharedPreferences.getInstance();
    String jsonList = jsonEncode(watchList);
    await prefs!.setString("WatchList", jsonList);
  }

  static loadList() async {
    WatchListMovie.prefs = await SharedPreferences.getInstance();

    String? savedJson = prefs!.getString("WatchList");
    List savedList = jsonDecode(savedJson!) as List;
    // print(savedJson);
    List<SavedMovie> movieList = List<SavedMovie>.from( savedList.map((i) => Movie.fromJson(i as Map<String, dynamic>)));
    // List<Movie> loadedList = movieList.map((movie) => Movie.fromResponse(movie)).toList();
    watchList = movieList;
  }
}
