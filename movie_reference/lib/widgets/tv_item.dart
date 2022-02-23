// import 'dart:typed_data';

import 'package:flutter/material.dart';
// import 'package:movie_reference/models/movie_model.dart';
import 'package:movie_reference/models/tvshow_model.dart';
import 'package:movie_reference/pages/tv_detail.dart';
import 'package:movie_reference/widgets/my_shimmer.dart';
// import 'package:shimmer/shimmer.dart';

bool loading = false;

class TVItem extends StatelessWidget {
  final TvShow tvshow;
  const TVItem({Key? key, required this.tvshow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => TVDetail(
                  tvId: tvshow.id.toString(),
                )));
      },
      child: Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          height: 200,
          width: 135,
          child: Image.network(
            tvshow.posterPath,
            loadingBuilder: (context, child, loadingProgress) =>
                loadingProgress == null
                    ? child
                    : const MyShimmer(
                        child: DummyTVItem(),
                      ),
            fit: BoxFit.cover,
          )),
    );
  }
}

class DummyTVItem extends StatelessWidget {
  const DummyTVItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      height: 200,
      width: 135,
    );
  }
}
