import 'package:fashionstown/features/home_details/presentation/view/widgets/home_details_image.dart';
import 'package:flutter/material.dart';

class HomeDetailsBody extends StatelessWidget {
  const HomeDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return   const Column(
      children: [
        HomeDetailsImage(imageUrl: 'a',),
      
      ],
    );
  }
}
class ProductNameAndDescription extends StatelessWidget {
  const ProductNameAndDescription({super.key, required this.productName, required this.productDescription});
  final String productName;
  final String productDescription;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(productName),
        Text(productDescription)
      ],
    );
  }
}