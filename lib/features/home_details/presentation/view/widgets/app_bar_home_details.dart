import 'package:fashionstown/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarHomeDetails extends StatelessWidget {
  const AppBarHomeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        GoRouter.of(context).pop();
      },
      child: const Padding(
        padding:  EdgeInsets.only(left: 15.0),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[  CircleAvatar(
            radius: 22,
            backgroundColor: textButtonAndMassage,
            child: Icon(Icons.arrow_back,color: Colors.black,),
          ),
        ]),
      ),
    );
  }
}