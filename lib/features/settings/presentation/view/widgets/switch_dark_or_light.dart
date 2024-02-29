import 'package:fashionstown/core/shared/theme_mode.dart';
import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/features/home/presentation/manager/cubit/product_cubit.dart';
import 'package:fashionstown/features/settings/presentation/manager/dark_cubit/theme_mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchDarkOrLight extends StatefulWidget {
  const SwitchDarkOrLight({super.key,});
  @override
  State<SwitchDarkOrLight> createState() => _SwitchDarkOrLightState();
}

class _SwitchDarkOrLightState extends State<SwitchDarkOrLight> {
   bool light = SaveThemeMode().getTheme();
  @override
  Widget build(BuildContext context) {
    return   Switch(
      value: light,
      activeColor: Colors.red,
      onChanged: (bool value) {
        setState(() {
          light = value;
          BlocProvider.of<ThemeModeCubit>(context).themeMode(value: light); 
        });
      },
    );
  }
}