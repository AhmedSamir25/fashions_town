import 'package:fashionstown/core/router/app_router.dart';
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
          if (snapshot.hasData) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Fashions Town',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: appColor),
                useMaterial3: true,
              ),
              routerConfig: AppRouter.router,
            );
          } else {
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