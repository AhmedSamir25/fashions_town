import 'package:flutter/material.dart';

class HomeDetailsImage extends StatelessWidget {
  const HomeDetailsImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return  Image.network(
      imageUrl,
      width:MediaQuery.of(context).size.width *1 ,
      height: MediaQuery.of(context).size.width *0.3 ,
    );
  }
}