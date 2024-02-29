import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,    
  //colorScheme: ColorScheme.fromSeed(seedColor: appColor),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.amber))
    )
  )
);