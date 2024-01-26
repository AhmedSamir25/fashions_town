import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.text, required this.textButton});
final String text;
final String textButton;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        text,
        style: TextStyles.textStyle14,
      ),
      TextButton(
        onPressed: () {},
        child: Text(
          textButton,
          style: TextStyles.textStyle14.copyWith(
            color: appColor,
          ),
        ),
      ),
    ]);
  }
}
