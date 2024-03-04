import 'package:fashionstown/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class RowTextBottomSheet extends StatelessWidget {
  const RowTextBottomSheet({super.key, required this.informationStatic, required this.variableValues, });
final String informationStatic ,variableValues;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(informationStatic,style: TextStyles.textStyle18,),
        const Spacer(flex: 4,),
        Text(variableValues,style: TextStyles.textStyle18,),
        const Spacer(flex: 1,),
      ],
    );
  }
}