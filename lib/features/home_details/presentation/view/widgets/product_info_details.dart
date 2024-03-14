import 'package:fashionstown/core/theme/text_style.dart';
import 'package:fashionstown/core/utils/widgets/add_favorite_button.dart';
import 'package:flutter/material.dart';

class ProductInfoDetails extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(productName,style: TextStyles.textStyle20,),
              const Spacer(flex: 6,),
            AddFavoriteButton(productId: productId, productName: productName, productImage: productImage, productPrice: productPrice, productCategory: productCategory),
              const Spacer(flex: 1,),
            ],
          ),
          Row(
              children:[ 
                Text('$productPrice\$',style: TextStyles.textStyle18,),
                const Spacer(flex: 12,),
                const Icon(Icons.star,size: 30,color: Colors.amber,),
                Text('($productAverageRate)',style: TextStyles.textStyle18,),
                const SizedBox(width: 6,),
                Text(productRating,style: TextStyles.textStyle16,),
                const Spacer(flex: 1,),
            ]),
            SizedBox(
              height: MediaQuery.of(context).size.height *0.015,
            ),
            Text('Description :',style: TextStyles.textStyle18,),
          SizedBox(
              height: MediaQuery.of(context).size.height *0.01,
            ),
          Text(productDescription,style: TextStyles.textStyle16,),
        ],
      ),
    );
  }
}