import 'package:fashionstown/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class HeaderBodyText extends StatelessWidget {
  const HeaderBodyText({
    required this.textHeader,
    required this.textBody,
    Key? key,
  }) : super(key: key);

  final String textHeader;
  final String textBody;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(textHeader,style: TextStyles.textStyle24,),
          Text(textBody,style: TextStyles.textStyle14,)
        ],
      ),
    );
  }
}
