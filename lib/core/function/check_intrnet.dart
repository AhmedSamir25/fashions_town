import 'package:fashionstown/core/function/cubit/check_internet_cubit.dart';
import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/utils/switch_theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckIntrnet extends StatefulWidget {
  const CheckIntrnet({super.key});

  @override
  State<CheckIntrnet> createState() => _CheckIntrentState();
}

class _CheckIntrentState extends State<CheckIntrnet> {
  @override
    Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetConnectionStatus>(
      builder: (context, state) {
        if (state == InternetConnectionStatus.connected) {
          return const SwitchThemeMode();
        } else {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Fashions Town',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: appColor),
                useMaterial3: true,
              ),
              home: const Text('data'),
            );
        }
      },
    );
  }
}
