import 'package:fashionstown/core/shared/theme_mode.dart';
import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/core/utils/widgets/custom_button_icon.dart';
import 'package:fashionstown/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:fashionstown/features/settings/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomListCart extends StatefulWidget {
  const CustomListCart(
      {super.key,  required this.networkImage,
       required this.productPrice, required this.productName,
         required this.productCount,
          required this.onPressedIncrease, required this.onPressedDecrease, required this.productCategory, required this.productId,
      });
  final String networkImage;
  final String productPrice;
  final String productName;
  final int productCount ; 
  final Function() onPressedIncrease;
  final Function() onPressedDecrease;
  final String productCategory;
  final String productId;

  @override
  State<CustomListCart> createState() => _CustomListCartState();
}

class _CustomListCartState extends State<CustomListCart> {
  @override
  Widget build(BuildContext context) {
    double widthMedia = MediaQuery.of(context).size.width;
    double heightMedia = MediaQuery.of(context).size.height;
    final favoriteCubit = BlocProvider.of<FavoriteCubit>(context);
    final addCartCubit = BlocProvider.of<CartCubit>(context);
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
                        widget.networkImage,  
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
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: widthMedia* 0.6
                        ),
                        child: Text(widget.productName,
                          style: TextStyles.textStyle16,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const Spacer(flex: 4,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        
                        CusttomIconButton(
                          colorIcon: favoriteCubit.isProductsInFavorite(productId: widget.productId)? addFavoriteColor :textButtonAndMassage ,
                            icon:  Icon(favoriteCubit.isProductsInFavorite(productId: widget.productId)? FontAwesomeIcons.solidHeart :FontAwesomeIcons.heart ,size: widthMedia*0.07,),
                            onPressed: ()  {
                            favoriteCubit.addFavorite(productId: widget.productId,
                             productName: widget.productName,
                              productImage: widget.networkImage,
                               productPrice: widget.productPrice,
                                productCategory: widget.productCategory);
                            
                            favoriteCubit.isProductsInFavorite(productId: widget.productId);
                            favoriteCubit.getFavoriteData();
                            addCartCubit.getCartData();
                            
                            
                          },),
                        SizedBox(width: widthMedia*0.07,),
                        CusttomIconButton(
                          colorIcon: addCartCubit.isProductsInCart(productId: widget.productId)? appColor : textButtonAndMassage,
                          icon:  Icon(Icons.remove_shopping_cart,size: widthMedia*0.075,),
                          onPressed: () {
                            setState(() {
                                
                              });
                              addCartCubit.isProductsInCart(productId: widget.productId);
                              addCartCubit.getCartData();
                              addCartCubit.addCart(
                                productId: widget.productId,
                               productName: widget.productName,
                                productImage: widget.networkImage,
                                 productPrice: widget.productPrice,
                                  productCategory: widget.productCategory,
                                   productCount: 1);
                          },
                        ),
                      ],
                    ),
                    const Spacer(flex: 1,),
                     Row(
                       children: [
                         Text(widget.productPrice,style: TextStyles.textStyle16,),
                          SizedBox(width: widthMedia*0.01),
                          TextButton(onPressed: widget.onPressedDecrease, child: Text('-',
                          style: TextStyles.textStyle24.copyWith(
                            color: SaveThemeMode().getTheme() ? textButtonAndMassage: textColor
                          )),),
                         Text(widget.productCount.toString(),style: TextStyles.textStyle16),
                         TextButton(onPressed: widget.onPressedIncrease, child: Text('+',
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