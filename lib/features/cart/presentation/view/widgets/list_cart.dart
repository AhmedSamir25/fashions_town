import 'package:fashionstown/core/shared/theme_mode.dart';
import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/core/utils/widgets/custom_button_icon.dart';
import 'package:flutter/material.dart';

class CustomListCart extends StatelessWidget {
  const CustomListCart(
      {super.key,  required this.networkImage,
       required this.productPrice, required this.productName,
         required this.productCount,
          required this.onPressedIncrease, required this.onPressedDecrease,
      });
  final String networkImage;
  final String productPrice;
  final String productName;
  final int productCount ; 
  final Function() onPressedIncrease;
  final Function() onPressedDecrease;
  @override
  Widget build(BuildContext context) {
    double widthMedia = MediaQuery.of(context).size.width;
    double heightMedia = MediaQuery.of(context).size.height;
        return Padding(
          padding: const EdgeInsets.only(top: 7.0,),
          child: Container(
            height: heightMedia*0.19,
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(16),
              color: SaveThemeMode().getTheme() ? backgroundColorItemDark : backgroundColorItemLight, 
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6.0,top: 3),
                  child: Center(
                    child: Container(
                      width: widthMedia * 0.3,
                        height: heightMedia * 0.17,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(image: NetworkImage(
                        networkImage,  
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width:widthMedia *0.03 ,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: widthMedia*0.59
                      ),
                      child: Text(productName,
                        style: TextStyles.textStyle16,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(flex: 4,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        
                        CusttomIconButton(
                          colorIcon: Colors.black,
                            icon:  Icon(Icons.add_shopping_cart,size: widthMedia*0.075),
                            onPressed: () {}),
                        SizedBox(width: widthMedia*0.07,),
                        CusttomIconButton(
                          colorIcon: Colors.black,
                          icon:  Icon(Icons.add_shopping_cart,size: widthMedia*0.075,),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const Spacer(flex: 1,),
                     Row(
                       children: [
                         Text(productPrice,style: TextStyles.textStyle16,),
                          SizedBox(width: widthMedia*0.13),
                          TextButton(onPressed: onPressedDecrease, child: Text('-',
                          style: TextStyles.textStyle24.copyWith(
                            color: SaveThemeMode().getTheme() ? textButtonAndMassage: textColor
                          )),),
                         Text(productCount.toString(),style: TextStyles.textStyle16),
                         TextButton(onPressed: onPressedIncrease, child: Text('+',
                         style: TextStyles.textStyle18.copyWith(
                          color: SaveThemeMode().getTheme() ? textButtonAndMassage: textColor  ,
                         ),),),
                       ],
                     ),
                     const Spacer(flex: 1,),
                  ],
                )
              ],
            ),
          ),
        );
      }
  }