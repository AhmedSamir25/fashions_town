import 'package:fashionstown/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({super.key, required this.socialAuthIcon, required this.heightButton, required this.widthButton, this.onPressed, required this.textButton});
final String socialAuthIcon;
final double heightButton;
final double widthButton;
final Function()? onPressed;
final String textButton;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
      fixedSize: MaterialStatePropertyAll(Size(widthButton, heightButton),),
    ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(socialAuthIcon,height: 50),
          const SizedBox(width: 10,),
          Text(textButton,style: TextStyles.textStyle14,)
        ],
      ),
    );
  }
}