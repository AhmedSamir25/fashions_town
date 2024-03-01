import 'package:fashionstown/core/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductInfoDetails extends StatelessWidget {
  const ProductInfoDetails({super.key, required this.productName,
    required this.productDescription, required this.productPrice});
  final String productName;
  final String productDescription;
  final String productPrice;
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
              IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.heart))
            ],
          ),
          Row(
              children:[ 
                Text('${productPrice} \$',style: TextStyles.textStyle18,),
                Text('2220')
            ]),
          Text(productDescription,style: TextStyles.textStyle16,)
        ],
      ),
    );
  }
}