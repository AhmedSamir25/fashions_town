import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({super.key, required this.socialAuthIcon, required this.heightButton, required this.widthButton});
final String socialAuthIcon;
final double heightButton;
final double widthButton;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){},
      style: ButtonStyle(
      fixedSize: MaterialStatePropertyAll(Size(widthButton, heightButton),),
    ),
      child: Image.asset(socialAuthIcon),
    );
  }
}