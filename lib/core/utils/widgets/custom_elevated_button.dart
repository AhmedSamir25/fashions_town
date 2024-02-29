import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.textButton, required this.style, required this.onPressed,});
  final String textButton;
  final ButtonStyle style;
  final Function() onPressed;
  @override
  Widget build( context) {
    return ElevatedButton(
            style: style, 
            onPressed: onPressed, 
          child:  Text(textButton,style: TextStyles.textStyle16.copyWith(
            color: textButtonAndMassage
          ),));
  }
}