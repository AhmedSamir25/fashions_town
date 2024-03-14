import 'package:fashionstown/core/shared/theme_mode.dart';
import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/core/utils/widgets/add_cart_button.dart';
import 'package:fashionstown/core/utils/widgets/add_favorite_button.dart';
import 'package:flutter/material.dart';

class CustomListProducts extends StatelessWidget {
  const CustomListProducts(
      {super.key,  required this.networkImage,
       required this.productPrice, required this.productName, required this.productId, required this.productCategory,
      });
  final String networkImage;
  final String productPrice;
  final String productName;
  final String productId;
  final String productCategory;

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
                       AddCartButton(
                        productId: productId,
                         productImage: networkImage,
                          productName: productName,
                           productPrice: productPrice,
                            productCategory: productCategory),
                        SizedBox(width: widthMedia*0.07,),
                       AddFavoriteButton(productId: productId, 
                       productName: productName, 
                       productImage: networkImage,
                        productPrice: productPrice,
                         productCategory: productCategory)
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