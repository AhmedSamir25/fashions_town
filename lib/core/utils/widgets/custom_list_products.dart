import 'package:fashionstown/core/shared/theme_mode.dart';
import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/core/utils/widgets/custom_button_icon.dart';
import 'package:flutter/material.dart';

class CustomListProducts extends StatelessWidget {
  const CustomListProducts(
      {super.key,  required this.networkImage,
       required this.productPrice, required this.productName,
      });
  final String networkImage;
  final String productPrice;
  final String productName;
  @override
  Widget build(BuildContext context) {
    double widthMedia = MediaQuery.of(context).size.width;
    double heightMedia = MediaQuery.of(context).size.height;
        return Padding(
          padding: const EdgeInsets.only(top: 7.0,),
          child: Container(
            height: heightMedia*0.18,
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
                    SizedBox(height:heightMedia*0.01 ,),
                    Row(
                      children: [
                        
                        CusttomIconButton(
                          colorIcon: Colors.black,
                            icon:  Icon(Icons.add_shopping_cart,size: widthMedia*0.07),
                            onPressed: () {}),
                        SizedBox(width: widthMedia*0.07,),
                        CusttomIconButton(
                          colorIcon: Colors.black,
                          icon:  Icon(Icons.add_shopping_cart,size: widthMedia*0.07,),
                          onPressed: () {},
                        ),
                      ],
                    ),
                     Text(productPrice,style: TextStyles.textStyle16,),
                  ],
                )
              ],
            ),
          ),
        );
      }
  }