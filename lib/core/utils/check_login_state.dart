import 'package:fashionstown/core/helper/check_intrnet.dart';
import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/features/auth/presentation/view/sign_in_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckUserLogin extends StatefulWidget {
  const CheckUserLogin({super.key});

  @override
  State<CheckUserLogin> createState() => _CheckUserLoginState();
}

class _CheckUserLoginState extends State<CheckUserLogin> {
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
        //Enter the Home Screen
          if (snapshot.hasData) {
            return const CheckIntrnet();
          } else {
            // Enter the Sign Screen
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Fashions Town',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: appColor),
                useMaterial3: true,
              ),
              home: const SignInView(),
            );
          }
        },
      );
  }
}