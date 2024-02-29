import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class CustomSignButton extends StatelessWidget {
  const CustomSignButton({super.key, required this.textButton, required this.heightButton, required this.widthButton,required this.onPressed,});
final String textButton;
final double heightButton;
final double widthButton;
final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,

    style: ButtonStyle(
      fixedSize: MaterialStatePropertyAll(Size(widthButton, heightButton),),
      backgroundColor: const MaterialStatePropertyAll(appColor)
    ),
     child: Text(textButton,style: TextStyles.textStyle20.copyWith(
      color: textButtonAndMassage,
     ),)
     );
  }
}