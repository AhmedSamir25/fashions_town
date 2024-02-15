import 'package:fashionstown/core/utils/widgets/custom_loading.dart';
import 'package:flutter/material.dart';

class SearchLoading extends StatelessWidget {
  const SearchLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 15,
      itemBuilder: (context, index) {
      return  Padding(
        padding:  const EdgeInsets.only(top: 4.0,),
        child: SizedBox(
          height: MediaQuery.of(context).size.height*0.18,
          width: MediaQuery.of(context).size.width*1,
          child:const LoadingShimmer()),
      );
    },);
  }
}