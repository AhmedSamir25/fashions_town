import 'package:flutter/material.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_style.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      color: appColor,
      minWidth: MediaQuery.of(context).size.width*0.9,
      padding: const EdgeInsets.symmetric(vertical: 12),
      onPressed: (){},
      child: Text('add cart',style: TextStyles.textStyle18,),
    );
  }
}
