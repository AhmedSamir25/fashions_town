import 'package:fashionstown/core/router/app_router.dart';
import 'package:fashionstown/core/theme/dark_theme.dart';
import 'package:fashionstown/core/theme/light_theme.dart';
import 'package:fashionstown/features/settings/presentation/manager/dark_cubit/theme_mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchThemeMode extends StatelessWidget {
  const SwitchThemeMode({super.key});

  @override
  Widget build(BuildContext context) {
     return BlocBuilder<ThemeModeCubit, ThemeModeState>(
              builder: (context, state) {
                if (state is DarkModeTheme) {
                return MaterialApp.router(
                          debugShowCheckedModeBanner: false,
                          title: 'Galaxy Store',
                          darkTheme: darkTheme,
                          routerConfig: AppRouter.router,
                        );  
                }else{
                return MaterialApp.router(
                          debugShowCheckedModeBanner: false,
                          title: 'Galaxy Store',
                          darkTheme: lightTheme,
                          routerConfig: AppRouter.router,
                        );
                }
              },
            );
  }
}