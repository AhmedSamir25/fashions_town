import 'package:fashionstown/core/router/app_router.dart';
import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/theme/dark_theme.dart';
import 'package:fashionstown/core/theme/light_theme.dart';
import 'package:fashionstown/features/auth/presentation/view/sign_in_view.dart';
import 'package:fashionstown/features/settings/presentation/manager/dark_cubit/theme_mode_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            return BlocBuilder<ThemeModeCubit, ThemeModeState>(
              builder: (context, state) {
                if (state is DarkModeTheme) {
                return MaterialApp.router(
                          debugShowCheckedModeBanner: false,
                          title: 'Fashions Town',
                          darkTheme: darkTheme,
                          routerConfig: AppRouter.router,
                        );  
                }else{
                return MaterialApp.router(
                          debugShowCheckedModeBanner: false,
                          title: 'Fashions Town',
                          darkTheme: lightTheme,
                          routerConfig: AppRouter.router,
                        );
                }
              },
            );
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