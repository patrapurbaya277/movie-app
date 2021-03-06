import 'package:flutter/material.dart';
import 'package:movie_reference/models/person_model.dart';
// import 'package:movie_reference/models/movie_model.dart';
// import 'package:movie_reference/models/tvshow_model.dart';
import 'package:movie_reference/widgets/my_shimmer.dart';
import 'package:movie_reference/widgets/person_item.dart';
// import 'package:shimmer/shimmer.dart';

// import 'movie_item.dart';
// import 'tv_item.dart';

class PeopleBuilder extends StatelessWidget {
  final String title;
  final Future<List<Person>> future;
  const PeopleBuilder({Key? key, required this.title, required this.future})
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
          FutureBuilder<List<Person>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Person> listData = List.from(snapshot.data!.toList());
                return SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      const SizedBox(width: 15),
                      ...listData.map((e) => PersonItem(person: e)).toList(),
                      const SizedBox(width: 15),
                    ],
                  ),
                );
              }
              if (!snapshot.hasData) {
                return const Text(
                  "No Data",
                  style: TextStyle(color: Colors.grey),
                );
              }
              return SizedBox(
                height: 200,
                child: MyShimmer(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return const DummyPersonItem();
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
