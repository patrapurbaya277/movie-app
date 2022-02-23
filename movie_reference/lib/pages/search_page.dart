import 'package:flutter/material.dart';
import 'package:movie_reference/styles.dart';

class SearchPage extends StatefulWidget {
  final String type;
  const SearchPage({Key? key, required this.type}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();
  FocusNode focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: TextFormField(
            cursorColor: mainColor,
            style: TextStyle(color: Colors.white),
            textInputAction: TextInputAction.search,
            controller: search,
            onFieldSubmitted: (_){},
            focusNode: focus,
            decoration: InputDecoration(
                hintText: "Search..",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: InputBorder.none),
          ),
        ),
        body: Container());
  }
}
