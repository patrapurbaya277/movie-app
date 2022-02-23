// import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:movie_reference/api/api_provider.dart';
import 'package:movie_reference/models/movie_model.dart';
import 'package:movie_reference/pages/movie_detail.dart';
import 'package:movie_reference/widgets/my_shimmer.dart';
// import 'package:shimmer/shimmer.dart';

bool loading = false;
class MovieItem extends StatelessWidget {
  final Movie movie;
  const MovieItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>MovieDetail(movieId: movie.id.toString())));
      },
      child: Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          height: 200,
          width: 135,
          child: Image.network(
            "${movie.posterPath}",
            loadingBuilder: (context, child, loadingProgress) =>
                loadingProgress == null
                    ? child
                    : const MyShimmer(
                        child: DummyMovieItem(),),
            fit: BoxFit.cover,
          )),
    );
  }
}

class DummyMovieItem extends StatelessWidget {
  const DummyMovieItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white
      ),
      height: 200,
      width: 135,
    );
  }
}
