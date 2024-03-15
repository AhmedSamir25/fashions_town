import 'package:fashionstown/core/constant/assets_manager.dart';
import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class NoInternetConnectionView extends StatelessWidget {
  const NoInternetConnectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fashions Town',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: appColor),
        useMaterial3: true,
      ),
      home:  Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 4/2.5,
              child: Image.asset(AssetsManager.noInternetConnection,)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
              Text('Please Check your internet',style: TextStyles.textStyle18,),
          ],
        ),
      ),
    );
  }
}
