import 'package:fashionstown/features/cart/presentation/view/widgets/list_cart_product.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.only(top: 12,left: 10,right: 10),
      child:  Column(
        children: [
          Expanded(child: ListCartProduct()),
        ],
      ),
    );
  }
}