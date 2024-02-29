import 'package:fashionstown/core/shared/theme_mode.dart';
import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/core/utils/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class OrderNow extends StatelessWidget {
  const OrderNow({super.key, required this.totalCart,});
final double totalCart;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: SaveThemeMode().getTheme() ? backgroundColorItemDark : backgroundColorItemLight,
        borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text('Order Summary',style: TextStyles.textStyle18,)),
           Row(
            children: [
              const Spacer(flex: 1,),
              Text('Total:',style: TextStyles.textStyle16,),
              const Spacer(flex: 14,),
              Text("$totalCart\$",style: TextStyles.textStyle16,),
              const Spacer(flex: 1,),
            ],
          ),
           CustomElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(appColor),
            ),
            textButton: 'Order Now',
            onPressed: (){},
            ),
        ],
      ),
    );
  }
}