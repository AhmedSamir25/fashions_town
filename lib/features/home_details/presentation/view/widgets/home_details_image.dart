import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDetailsImage extends StatelessWidget {
  const HomeDetailsImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width:MediaQuery.of(context).size.width *0.9,
          height: MediaQuery.of(context).size.height *0.3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        Positioned(
          top: 20,
          child: Image.network(
            width:MediaQuery.of(context).size.width *0.5,
            imageUrl,
            height: MediaQuery.of(context).size.height *0.25 ,fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}