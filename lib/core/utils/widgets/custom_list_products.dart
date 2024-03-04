import 'package:fashionstown/core/shared/theme_mode.dart';
import 'package:fashionstown/core/theme/colors.dart';
import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/core/utils/widgets/custom_button_icon.dart';
import 'package:fashionstown/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:fashionstown/features/settings/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomListProducts extends StatefulWidget {
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
  State<CustomListProducts> createState() => _CustomListProductsState();
}

class _CustomListProductsState extends State<CustomListProducts> {
  @override
  Widget build(BuildContext context) {
    double widthMedia = MediaQuery.of(context).size.width;
    double heightMedia = MediaQuery.of(context).size.height;
    final favoriteCubit = BlocProvider.of<FavoriteCubit>(context);
    final addCartCubit = BlocProvider.of<CartCubit>(context);
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
                      child: Text(widget.productName,
                        style: TextStyles.textStyle16,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height:heightMedia*0.01 ,),
                    Row(
                      children: [
                        
                        CusttomIconButton(
                          colorIcon: addCartCubit.isProductsInCart(productId: widget.productId)? appColor : textButtonAndMassage,
                            icon:  Icon(Icons.shopping_cart,size: widthMedia*0.07),
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
                            }),
                        SizedBox(width: widthMedia*0.07,),
                        CusttomIconButton(
                          colorIcon: favoriteCubit.isProductsInFavorite(productId: widget.productId)? addFavoriteColor :textButtonAndMassage ,
                          icon:  Icon(favoriteCubit.isProductsInFavorite(productId: widget.productId)? FontAwesomeIcons.solidHeart :FontAwesomeIcons.heart ,size: widthMedia*0.07,),
                          onPressed: () {
                            favoriteCubit.addFavorite(productId: widget.productId,
                             productName: widget.productName,
                              productImage: widget.networkImage,
                               productPrice: widget.productPrice,
                                productCategory: widget.productCategory);
                            favoriteCubit.getFavoriteData();
                            favoriteCubit.isProductsInFavorite(productId: widget.productId);
                          },
                        ),
                      ],
                    ),
                     Text(widget.productPrice,style: TextStyles.textStyle16,),
                  ],
                )
              ],
            ),
          ),
        );
      }
}