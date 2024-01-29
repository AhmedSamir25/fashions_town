import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({super.key, required this.socialAuthIcon, required this.heightButton, required this.widthButton, this.onPressed});
final String socialAuthIcon;
final double heightButton;
final double widthButton;
final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
      fixedSize: MaterialStatePropertyAll(Size(widthButton, heightButton),),
    ),
      child: Image.asset(socialAuthIcon),
    );
  }
}