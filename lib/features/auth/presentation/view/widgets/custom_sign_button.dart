import 'package:fashionstown/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomSignButton extends StatelessWidget {
  const CustomSignButton({super.key, required this.textButton, required this.heightButton, required this.widthButton,});
final String textButton;
final double heightButton;
final double widthButton;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){},

    style: ButtonStyle(
      fixedSize: MaterialStatePropertyAll(Size(widthButton, heightButton),),
      backgroundColor: const MaterialStatePropertyAll(appColor)
    ),
     child: Text(textButton,style:const TextStyle(color: Colors.white),)
     );
  }
}