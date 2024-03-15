import 'package:fashionstown/core/helper/cubit/check_internet_cubit.dart';
import 'package:fashionstown/core/utils/no_internet_connection.dart';
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
          return const NoInternetConnectionView();
        }
      },
    );
  }
}
