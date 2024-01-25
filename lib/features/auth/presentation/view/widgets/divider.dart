import 'package:fashionstown/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class  DividerWidget extends StatelessWidget {
  const  DividerWidget({super.key, required this.textDivider});
final String textDivider;
  @override
  Widget build(BuildContext context) {
    
    return Row(
      children: [
        const Flexible(
          child:  SizedBox(
            width: 100,
            child:   Divider(
              color: Colors.grey,
              height: 45,
            ),
          ),
        ),
        const SizedBox(width: 20,),
        Text(textDivider,style: TextStyles.textStyle14,),
        const SizedBox(width: 20,),
        const Flexible(
          child:  SizedBox(
            width: 100,
            child:   Divider(
              color: Colors.grey,
             height: 45,
            ),
          ),
        ),
      ],
    );
  }
}