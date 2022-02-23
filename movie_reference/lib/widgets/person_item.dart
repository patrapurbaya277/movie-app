// import 'dart:typed_data';

import 'package:flutter/material.dart';
// import 'package:movie_reference/models/movie_model.dart';
import 'package:movie_reference/models/person_model.dart';
// import 'package:movie_reference/pages/movie_detail.dart';
import 'package:movie_reference/pages/people_detail.dart';
import 'package:movie_reference/styles.dart';
import 'package:movie_reference/widgets/my_shimmer.dart';
// import 'package:shimmer/shimmer.dart';

bool loading = false;
class PersonItem extends StatelessWidget {
  final Person person;
  const PersonItem({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>PeopleDetail(personId: person.id.toString())));
      },
      child: Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
          height: 200,
          width: 135,
          child: Image.network(
            person.profilePath,
            errorBuilder: (context, error, stackTrace) => const DummyPersonItem(errorText: "Profile Image Not Found",),
            loadingBuilder: (context, child, loadingProgress) =>
                loadingProgress == null
                    ? child
                    : const MyShimmer(
                        child: DummyPersonItem(),),
            fit: BoxFit.cover,
          )),
    );
  }
}

class DummyPersonItem extends StatelessWidget {
  final String? errorText;
  const DummyPersonItem({
    this.errorText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: mainColor
      ),
      height: 200,
      width: 135,
      child: Center(child: Text(errorText??"",textAlign: TextAlign.center,style: const TextStyle(color: Colors.red),)),
    );
  }
}
