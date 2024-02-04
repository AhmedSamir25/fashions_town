import 'package:fashionstown/core/router/app_router.dart';
import 'package:fashionstown/features/home/presentation/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const CustomTextField(),
        TextButton(onPressed: (){
           GoRouter.of(context).push(
                  AppRouter.forgotPassword,
                );
        }, child:const Text('aaa'))
      ],
    );
  }
}
//Pubspec 