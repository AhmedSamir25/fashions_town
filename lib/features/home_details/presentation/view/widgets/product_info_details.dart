import 'package:fashionstown/core/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductInfoDetails extends StatelessWidget {
  const ProductInfoDetails({super.key, required this.productName,
    required this.productDescription, required this.productPrice, required this.productAverageRate, required this.productRating});
  final String productName;
  final String productDescription;
  final String productPrice;
  final String productAverageRate;
  final String productRating;
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
              IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.heart)),
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
          Text(productDescription,style: TextStyles.textStyle16,)
        ],
      ),
    );
  }
}