import 'package:fashionstown/core/shared/theme_mode.dart';
import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/core/utils/widgets/custom_elevated_button.dart';
import 'package:fashionstown/features/cart/presentation/view/widgets/row_text_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ShowBottomSheetOrder {
    Future showBottomSheetOrder(BuildContext context, String totalPrice, {required Function() onPressed}){
    return showModalBottomSheet(
      context: context,
      backgroundColor:  SaveThemeMode().getTheme() ? backgroundColorItemDark : backgroundColorItemLight,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
     builder: (BuildContext context ,) {
     return   Padding(
       padding: const EdgeInsets.symmetric(horizontal: 8.0),
       child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('your order :',style: TextStyles.textStyle20,),
            RowTextBottomSheet(informationStatic: 'total price:',variableValues: "$totalPrice\$",),
            const RowTextBottomSheet(informationStatic: 'payment method:', variableValues: 'cash on delivery'),
            const RowTextBottomSheet(informationStatic: 'Delivery duration:', variableValues: '2 : 5 days'),
          SizedBox(height:MediaQuery.of(context).size.height * 0.04 ,),
          Center(
            child: CustomElevatedButton(textButton: 'order now',
             style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(appColor)
             ),
              onPressed:onPressed),
          )
         ],
         ),
       ),
     );  
     },
     );
  }
}