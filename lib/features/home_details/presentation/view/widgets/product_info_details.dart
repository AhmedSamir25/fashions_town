import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/features/home_details/presentation/manager/cubit/product_details_cubit.dart';
import 'package:fashionstown/features/settings/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductInfoDetails extends StatefulWidget {
  const ProductInfoDetails({super.key, required this.productName,
    required this.productDescription, required this.productPrice, required this.productAverageRate, required this.productRating, required this.productId, required this.productCategory, required this.productImage});
  final String productName;
  final String productDescription;
  final String productPrice;
  final String productAverageRate;
  final String productRating;
  final String productId;
  final String productCategory;
  final String productImage;

  @override
  State<ProductInfoDetails> createState() => _ProductInfoDetailsState();
}

class _ProductInfoDetailsState extends State<ProductInfoDetails> {
  @override
  Widget build(BuildContext context) {
    final favoriteCubit =  BlocProvider.of<FavoriteCubit>(context);
    final productInfoCubit = BlocProvider.of<ProductDetailsCubit>(context);
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(widget.productName,style: TextStyles.textStyle20,),
              const Spacer(flex: 6,),
              IconButton(onPressed: (){
                setState(() {
                  favoriteCubit.addFavorite(productId: widget.productId, productName: widget.productName, productImage: widget.productImage, productPrice: widget.productPrice, productCategory: widget.productCategory); 
                  favoriteCubit.getFavoriteData();
                  
                  productInfoCubit.getProductData(productId: widget.productId);
                });
                 
              }, icon:  Icon(favoriteCubit.isProductsInFavorite(productId:widget.productId ) ? FontAwesomeIcons.solidHeart :FontAwesomeIcons.heart ,
                
              color: favoriteCubit.isProductsInFavorite(productId: widget.productId)?Colors.red :Colors.grey[700],),
              ),
              const Spacer(flex: 1,),
            ],
          ),
          Row(
              children:[ 
                Text('${widget.productPrice}\$',style: TextStyles.textStyle18,),
                const Spacer(flex: 12,),
                const Icon(Icons.star,size: 30,color: Colors.amber,),
                Text('(${widget.productAverageRate})',style: TextStyles.textStyle18,),
                const SizedBox(width: 6,),
                Text(widget.productRating,style: TextStyles.textStyle16,),
                const Spacer(flex: 1,),
            ]),
            SizedBox(
              height: MediaQuery.of(context).size.height *0.015,
            ),
            Text('Description :',style: TextStyles.textStyle18,),
          SizedBox(
              height: MediaQuery.of(context).size.height *0.01,
            ),
          Text(widget.productDescription,style: TextStyles.textStyle16,),
        ],
      ),
    );
  }
}