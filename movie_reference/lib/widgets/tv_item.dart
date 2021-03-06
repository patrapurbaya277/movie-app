// import 'dart:typed_data';

import 'package:flutter/material.dart';
// import 'package:movie_reference/models/movie_model.dart';
import 'package:movie_reference/models/tv_show_model.dart';
import 'package:movie_reference/pages/tv_detail.dart';
import 'package:movie_reference/styles.dart';
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
            errorBuilder: (context, error, stackTrace) => const DummyTVItem(errorText: "TV Shows Image Not Found",),
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
  final String? errorText;
  const DummyTVItem({
    this.errorText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: mainColor),
      height: 200,
      width: 135,
      child: Text(errorText??"",textAlign: TextAlign.center ,style: const TextStyle(color: Colors.red),),
    );
  }
}
