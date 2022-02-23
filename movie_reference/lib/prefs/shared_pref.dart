import 'dart:convert';

import 'package:movie_reference/prefs/saved_movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WatchListMovie {
  static List<SavedMovie> watchList = [];
  static SharedPreferences? prefs;
  static List<SavedMovie> tempList=[];

  static addToList(SavedMovie item) {
    if (!tempList.contains(item)) {
      tempList.add(item);
      watchList=tempList.reversed.toList();
    }
  }

  static deleteItem(SavedMovie item) {
    watchList.remove(item);
    // print("deleted");
  }

  static saveList() async {
    prefs = await SharedPreferences.getInstance();
    String jsonList1 = jsonEncode(tempList);
    await prefs!.setString("TempList", jsonList1);
    
  }

  static loadList() async {
    List? savedList;
    WatchListMovie.prefs = await SharedPreferences.getInstance();
    String? savedJson = prefs!.getString("TempList");
    if (savedJson != null) {
      savedList = jsonDecode(savedJson) as List;
      List<SavedMovie> movieList = List<SavedMovie>.from(
          savedList.map((i) => SavedMovie.fromJson(i as Map<String, dynamic>)));
      tempList = movieList;
      watchList = tempList.reversed.toList();
    }
  }
}
