import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer(
      {super.key,});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 202, 203, 235),
      highlightColor: Color.fromARGB(255, 252, 227, 227),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}